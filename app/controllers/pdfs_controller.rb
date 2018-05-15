class PdfsController < ApplicationController
  require 'zip'
  before_action :create_common, only: [:create, :create_all]

  #Creates a single pdf file for a client
  def create

    #Creates the appropriate pdf according to the pdf_id supplied
    pdf = Pdf.create_pdf(@pdf_id, @client, @settings)

    disposition = false
    if @inline == "true"
      disposition = "inline"
    end
    respond_to do |format|
      format.pdf do
          send_data pdf.render,
          filename: Pdf.get_pdf_file_name(Pdf::PDFS.keys[@pdf_id.to_i], @client),
          disposition: disposition
        end
      end
  end

  #Creates all pdfs in the system
  def create_all
      for i in 0..Pdf.get_pdf_file_count do
        pdf = Pdf.create_pdf(i.to_s, @client, @settings)
        pdf_file_name = Pdf.get_pdf_file_name(Pdf::PDFS.keys[i], @client)
        pdf.render_file("tmp/generated-pdfs/#{pdf_file_name}")
      end
      generate_zip(@client)
  end

  def get_zip_folder_name(client)
    return "#{client.first_name} #{client.last_name} - #{Date.today.to_s}.zip"
  end

  def index
    @pdfs = Pdf::PDFS
    @client = Client.find(params[:client_id])
  end

  def show

  end

  private

  def create_common
    @client = Client.find(params[:client_id])
    @pdf_id = params[:pdf_id]
    @inline = params[:inline]
    @settings = get_settings
  end

  def generate_zip(client)
    filename = "tmp/generated-pdfs/#{get_zip_folder_name(client)}"
    temp_file = Tempfile.new(filename)
    input_filenames = Dir.entries("tmp/generated-pdfs/").select {|f| !File.directory? f}
    folder = "tmp/generated-pdfs/"

    begin
      #This is the tricky part
      #Initialize the temp file as a zip file
      Zip::OutputStream.open(temp_file) { |zos| }

      #Add files to the zip file as usual
      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |file|
      zipfile.add(file,  File.join(folder, file))
      end
    end

    #Read the binary data from the file
    zip_data = File.read(temp_file.path)

    #Send the data to the browser as an attachment
    #We do not send the file directly because it will
    #get deleted before rails actually starts sending it
    send_data(zip_data, :type => 'application/zip', :filename => get_zip_folder_name(client))
    ensure
      #Close and delete the temp file
      temp_file.close
      temp_file.unlink
      FileUtils.rm_rf(Dir.glob("tmp/generated-pdfs/*"))
    end
  end


end
