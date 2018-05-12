class MotorVehicleRegistrationRequestClerkOfCourt < Prawn::Document

  PDF_NAME = "Motor Vehicle Registration Request Clerk of Court"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[281, 681], style: :bold)
      self.text_box(@settings.county_name, at:[191, 660], style: :bold)
      self.text_box(@client.case_number, at:[410, 639], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,509], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[188, 225], style: :bold)
      self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[422, 225], style: :bold)
      self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[340, 204], style: :bold)
      self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[55, 184], style: :bold)
      self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[185, 184], style: :bold)
      self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[230, 163], style: :bold)
      self.text_box(Date.today.to_s, at:[145, 122], style: :bold)
    rescue
  end

  end

end
