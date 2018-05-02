class LevyInstructions < Prawn::Document

  PDF_NAME = "Levy Instructions --WIP--"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@settings.jc_number, at:[285, 681], style: :bold)
      self.text_box(@settings.county_name, at:[204, 661], style: :bold)
      self.text_box(@client.case_number, at:[415, 640], style: :bold)
      self.draw_text("#{@client.first_name} #{@client.last_name}", at:[56,570], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[56,509], style: :bold)
      self.text_box(@settings.county_name, at:[153, 447], style: :bold)
      self.text_box(@client.court_order_county, at:[417, 391], style: :bold)
      self.draw_text("#{@client.owes_money_first_name} #{@client.owes_money_last_name}", at:[290,357], style: :bold)



      #
      # self.text_box(@client.dissolution_of_marriage.to_s, at:[189, 225], style: :bold)
      # self.text_box(@client.monthly_cs_bi_monthly_amount.to_s, at:[433, 225], style: :bold)
      # self.text_box(@client.monthly_cs_date_of_last_child_support_payment.to_s, at:[340, 205], style: :bold)
      # self.text_box(@client.monthly_cs_averages_owed_as_of.to_s, at:[437, 205], style: :bold)
      # self.text_box(@client.monthly_cs_number_of_months_delinquent_child_support.to_s, at:[127, 184], style: :bold)
      # self.text_box((@client.monthly_cs_number_of_months_delinquent_child_support * @client.monthly_cs_bi_monthly_amount).to_s, at:[167, 163], style: :bold)
      # self.text_box(Date.today.to_s, at:[145, 122], style: :bold)
    rescue
  end

  end

end
