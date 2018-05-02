class CoverLetterForJudge < Prawn::Document

  PDF_NAME = "Cover Letter for Judge"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(@client.judge_name, at:[111, 518], style: :bold)
      self.text_box(@client.judge_courtroom, at:[225, 503], style: :bold)
      self.text_box(@client.case_number, at:[329, 435], style: :bold)
      self.text_box(@client.judge_name, at:[93, 408], style: :bold)
      self.text_box(@client.first_name, at:[228, 380], style: :bold)
      self.text_box(@client.last_name, at:[360, 380], style: :bold)
      self.text_box(@client.owes_money_first_name, at:[332, 365], style: :bold)
      self.text_box(@client.owes_money_last_name, at:[428, 365], style: :bold)
    rescue
  end

  end

end
