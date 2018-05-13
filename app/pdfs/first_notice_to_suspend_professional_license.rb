class FirstNoticeToSuspendProfessionalLicense < Prawn::Document

  PDF_NAME = "First Notice to Suspend Professional License"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(Date.today.to_s, at:[55, 532], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[146,498], style: :bold)
      self.draw_text("#{@client.owes_money_address}, #{@client.owes_money_city}, #{@client.owes_money_state}", at:[97,483], style: :bold)
      self.text_box(@client.case_number, at:[345, 395], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[80,360], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[180,318], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[155, 222], style: :bold)
      self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[61, 201], style: :bold)
      self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[367, 201], style: :bold)
      self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[55, 180], style: :bold)
      self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[185, 180], style: :bold)
      self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[230, 160], style: :bold)
    rescue
  end

  end

end
