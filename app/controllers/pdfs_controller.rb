class PdfsController < ApplicationController

  def create
    client = Client.find(params[:client_id])
    respond_to do |format|
      format.pdf do
          pdf = TestPdf.new(client)
          send_data pdf.render,
          filename: "docTest.pdf",
          disposition: "inline"
        end
      end
  end

  def create_pdfs

  end

  def index
    @pdfs = Pdf.get_pdfs()
    @client = Client.find(params[:client_id])
  end

  def show

  end

end
