class NoticeOfFilingAnswerOfGarnishee < Prawn::Document

  PDF_NAME = "Notice of Filing Answer of Garnishee"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[452, 681], style: :bold)
      self.text_box(@settings.county_name, at:[268, 653], style: :bold)
      self.text_box(@client.case_number, at:[330, 625], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,523], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,425], style: :bold)
      self.draw_text("What is Garnishee???", at:[56,329], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[143,287], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[244,246], style: :bold)
      self.draw_text(Date.today.to_s, at:[90,163], style: :bold)
      self.go_to_page(2)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[109,447], style: :bold)
      self.draw_text(Date.today.to_s, at:[165,420], style: :bold)
    rescue
  end

  end

end
