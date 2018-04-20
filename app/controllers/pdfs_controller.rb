class PdfsController < ApplicationController

  #Creates a single pdf file for a client
  def create

    client = Client.find(params[:client_id])
    pdf_id = params[:pdf_id]
    inline = params[:inline]
    settings = get_settings

    #Creates the appropriate pdf according to the pdf_id supplied
    pdf = Pdf.create_pdf(pdf_id, client, settings)

    disposition = false

    if inline == "true"
      disposition = "inline"
    end

    respond_to do |format|
      format.pdf do
          send_data pdf.render,
          filename: pdf.get_file_name,
          disposition: disposition
        end
      end
  end

  def index
    @pdfs = Pdf::PDFS
    @client = Client.find(params[:client_id])
  end

  def show

  end

end
