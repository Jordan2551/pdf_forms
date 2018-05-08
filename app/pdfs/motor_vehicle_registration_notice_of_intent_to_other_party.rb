class MotorVehicleRegistrationNoticeOfIntentToOtherParty < Prawn::Document

  PDF_NAME = "Motor Vehicle Registration Notice of Intent to Other Party"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(Date.today.to_s, at:[55, 518], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[125,482], style: :bold)
      self.draw_text("#{@client.owes_money_address}, #{@client.owes_money_city}, #{@client.owes_money_state}", at:[122,468], style: :bold)
      self.text_box(@client.case_number, at:[346, 407], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[80,372], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[181,330], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[155, 152], style: :bold)
      self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[61, 130], style: :bold)
      self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[388, 130], style: :bold)
      self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[54, 110], style: :bold)
      self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[192, 110], style: :bold)
      self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[230, 90], style: :bold)
    rescue
  end

  end

end
