class IncomeDeductionAndWageGarnishmentJudgeCoverLetter < Prawn::Document

  PDF_NAME = "Income Deduction and Wage Garnishment Judge cover letter"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(Date.today.to_s, at:[38, 545], style: :bold)
      self.text_box(@client.judge_name, at:[111, 517], style: :bold)
      self.text_box(@client.judge_courtroom, at:[225, 503], style: :bold)
      self.text_box(@client.case_number, at:[328, 434], style: :bold)
      self.text_box(@client.judge_name, at:[94, 407], style: :bold)
      self.text_box(@client.first_name, at:[228, 379], style: :bold)
      self.text_box(@client.last_name, at:[396, 379], style: :bold)
      self.text_box(@client.first_name, at:[408, 365], style: :bold)
      self.text_box(@client.last_name, at:[37, 351], style: :bold)
    rescue
  end

  end

end
