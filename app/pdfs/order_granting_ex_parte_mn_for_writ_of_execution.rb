class OrderGrantingExParteMnForWritOfExecution < Prawn::Document

  PDF_NAME = "Order Granting Ex Parte Mn for Writ of Execution"

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
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,405], style: :bold)
      self.text_box(@client.court_order_county, at:[294, 288])
      self.text_box(@client.vin, at:[83, 246], style: :bold)
      self.draw_text("#{@client.owes_money_address}, #{@client.owes_money_city}, #{@client.owes_money_state}", at:[230,239], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[290, 205], style: :bold)
      self.text_box(@client.court_order_county, at:[183, 143], style: :bold)
      self.text_box(Date.today.to_s, at:[408, 143], style: :bold)
    rescue
  end

  end

end
