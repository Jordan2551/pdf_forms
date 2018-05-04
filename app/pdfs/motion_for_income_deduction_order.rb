class MotionForIncomeDeductionOrder < Prawn::Document

  PDF_NAME = "Motion for Income Deduction Order"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[282, 681], style: :bold)
      self.text_box(@settings.county_name, at:[203, 661], style: :bold)
      self.text_box(@client.case_number, at:[415, 639], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,509], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[240,425], style: :bold)
      self.text_box(@client.dissolution_of_marriage.to_s, at:[350, 329], style: :bold)
      self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[244, 307], style: :bold)
      self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[411, 286], style: :bold)
      self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[148, 266], style: :bold)
      self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[280, 266], style: :bold)
      self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[424, 245], style: :bold)
      self.go_to_page(3)
      self.text_box("Which field?", at:[115, 681], style: :bold)
      self.text_box(Date.today.to_s, at:[127, 460], style: :bold)
      self.text_box(@client.owes_money_email, at:[250, 379], style: :bold)
      self.text_box(Date.today.to_s, at:[141, 357], style: :bold)
    rescue
  end

  end

end
