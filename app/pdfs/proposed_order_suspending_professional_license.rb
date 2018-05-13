class ProposedOrderSuspendingProfessionalLicense < Prawn::Document

  PDF_NAME = "Proposed Order Suspending Professional License"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[270, 681], style: :bold)
      self.text_box(@settings.county_name, at:[212, 660], style: :bold)
      self.text_box(@client.case_number, at:[414, 619], style: :bold)
      self.text_box("What is this?", at:[325, 432], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,550], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,488], style: :bold)
      self.text_box(@client.vin, at:[169, 225], style: :bold)
      self.text_box(Date.today.to_s, at:[395, 142], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[55,45], style: :bold)
    rescue
  end

  end

end
