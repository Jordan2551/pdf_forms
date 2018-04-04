class Pdf
  #THIS SHOULD BE A MODULE
  PDF_FONT_SIZE = 10

  PDF_TEST_DOC = "0"
  PDF_TEST_DOC_2 = "1"

  PDFS = {"testDoc": PDF_TEST_DOC, "testDoc2": PDF_TEST_DOC_2}

  def self.create_pdf(pdf_id, client, settings)
    if pdf_id == PDF_TEST_DOC
      return TestPdf.new(client, settings)
    elsif pdf_id == PDF_TEST_DOC_2
      return TestPdf.new(client, settings)
    end
  end

  #TODO: Queue db for pdf list
  def self.get_pdfs
  end

  #Creates all possible pdf files for the client
  def self.create_pdfs

  end

end
