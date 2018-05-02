class OrderGrantingMotionForBreakOrder < Prawn::Document

  PDF_NAME = "Order Granting Motion for Break Order"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[281, 681], style: :bold)
      self.text_box(@settings.county_name, at:[205, 661], style: :bold)
      self.text_box(@client.case_number, at:[414, 640], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,509], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[93,405], style: :bold)
      self.text_box(@settings.county_name, at:[291, 288], style: :bold)
      self.draw_text("#{@client.owes_money_address}, #{@client.owes_money_city}, #{@client.owes_money_state}", at:[54,240], style: :bold)
      self.text_box(@client.vin, at:[191, 225], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[221, 184], style: :bold)
      self.text_box(@client.court_order_county.to_s, at:[183, 143], style: :bold)
      self.text_box(Date.today.to_s, at:[403, 143], style: :bold)
    rescue
  end

  end

end
