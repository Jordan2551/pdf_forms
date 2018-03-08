class TestPdf < Prawn::Document

  # The ____th judicial circuit?
  # FOR ________
  # CASE NO_____

  def initialize(client)
    super(template: "#{Rails.root}/app/assets/pdfs/testdoc.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    # self.set_color_space "#0000ff"
    self.draw_text(client.petitioner, at:[57, 550])
    # self.draw_text(client.petitioner, at:[57,550])
    self.draw_text(client.respondent, at:[57,467])
    self.draw_text(client.garnishee,  at:[57,385])

    #NOTICE TO INDIVIDUAL DEFENDANT FOR CLAIM OF EXEMPTION FROM GARNISHMENT PURSUANT TO FLORIDA STATUTE 77.041
    self.draw_text(client.respondent,  at:[105,260])
    self.draw_text(client.address,  at:[116,246])

    #YOU ARE NOTIFIED that a Writ of Garnishment has been issued in the above-entitled
    self.draw_text(client.bank_name,  at:[414,177])

    #CERTIFICATE OF SERVICE (NEXT PAGE)
    self.go_to_page(2)
    self.draw_text(client.respondent, at:[314,475])
    self.draw_text(client.bank_name, at:[274,420])
    self.draw_text(client.bank_address, at:[123,392])
    #SKIP_____?
    self.draw_text(DateTime.now().to_date, at:[145,337])

  end
end
