class TestPdf < Prawn::Document

  PDF_NAME = "testdoc"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    #IN THE CIRCUIT COURT OF THE
    self.text_box(@settings.jc_number, at:[451, 682], style: :bold)
    self.text_box(@settings.county_name, at:[270, 653], style: :bold)

    self.text_box(@client.case_number, at:[335, 598], style: :bold)
    self.text_box(@client.petitioner, at:[58, 557], style: :bold)
    self.draw_text(@client.respondent, at:[58,467], style: :bold)
    self.draw_text(@client.garnishee,  at:[58,385], style: :bold)

    #NOTICE TO INDIVIDUAL DEFENDANT FOR CLAIM OF EXEMPTION FROM GARNISHMENT PURSUANT TO FLORIDA STATUTE 77.041
    self.draw_text(@client.respondent,  at:[110,260], style: :bold)
    self.draw_text(@client.address,  at:[123,246], style: :bold)

    #YOU ARE NOTIFIED that a Writ of Garnishment has been issued in the above-entitled
    self.draw_text(@client.bank_name,  at:[123,155], style: :bold)

    #CERTIFICATE OF SERVICE (NEXT PAGE)
    self.go_to_page(2)
    self.text_box(@client.case_number, at:[321, 717], style: :bold)
    self.draw_text(@client.respondent, at:[88,450], style: :bold)
    self.draw_text(@client.bank_name, at:[276,424], style: :bold)
    self.draw_text(@client.bank_address, at:[143,398], style: :bold)
    self.draw_text(@client.created_at.to_date, at:[150,344], style: :bold)

  end

  def get_file_name()
    return "#{PDF_NAME}#{@client.id}.pdf"
  end

end
