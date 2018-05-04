class NoticeOfFilingCertMailReceipt < Prawn::Document

  PDF_NAME = "Notice of Filing Cert Mail Receipt"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[280, 681], style: :bold)
      self.text_box(@settings.county_name, at:[188, 660], style: :bold)
      self.text_box(@client.case_number, at:[399, 639], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[38,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[38,508], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[75,446], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[38,404], style: :bold)
      self.draw_text("What is this?", at:[120,390], style: :bold)
      self.text_box(@client.owes_money_email, at:[197, 317], style: :bold)
      self.text_box(Date.today.to_s, at:[68, 294], style: :bold)
    rescue
  end

  end

end
