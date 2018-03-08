class PdfsController < ApplicationController

  #Creates a single pdf file for a client
  def create

    client = Client.find(params[:client_id])
    pdf_id = params[:id]
    settings = Setting.find(1)

    #Creates the appropriate pdf according to the pdf_id supplied
    pdf = Pdf.create_pdf(pdf_id, client, settings)

    respond_to do |format|
      format.pdf do
          send_data pdf.render,
          filename: pdf.get_file_name,
          disposition: "inline"
        end
      end
  end

  #Creates all possible pdf files for the client
  def create_pdfs

  end

  def index
    @pdfs = Pdf::PDFS
    @client = Client.find(params[:client_id])
  end

  def show

  end

end
