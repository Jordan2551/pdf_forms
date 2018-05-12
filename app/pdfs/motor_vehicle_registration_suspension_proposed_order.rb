class MotorVehicleRegistrationSuspensionProposedOrder < Prawn::Document

  PDF_NAME = "Motor Vehicle Registration Suspension Proposed Order"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[274, 681], style: :bold)
      self.text_box(@settings.county_name, at:[194, 661], style: :bold)
      self.text_box(@client.case_number, at:[414, 639], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,508], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,410], style: :bold)
      self.text_box(@client.court_order_county, at:[294, 288])
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[179,224], style: :bold)
      self.text_box("What is this?", at:[125, 211], style: :bold)
      self.text_box("What is this?", at:[240, 211], style: :bold)
      self.text_box(Date.today.to_s, at:[395, 170], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,66], style: :bold)
    rescue
  end

  end

end
