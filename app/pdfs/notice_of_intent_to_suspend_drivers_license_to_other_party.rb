class NoticeOfIntentToSuspendDriversLicenseToOtherParty < Prawn::Document

  PDF_NAME = "Notice of Intent to Suspend Driver's License to other Party"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[125,482], style: :bold)
      self.draw_text("#{@client.owes_money_address}, #{@client.owes_money_city}, #{@client.owes_money_state}", at:[104,455], style: :bold)
      self.text_box(@client.case_number, at:[345, 379], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[80,345], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[181,302], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[155, 125], style: :bold)
      self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[111, 103], style: :bold)
      self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[438, 103], style: :bold)
      self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[94, 82], style: :bold)
      self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[226, 83], style: :bold)
      self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[286, 61], style: :bold)
    rescue
  end

  end

end
