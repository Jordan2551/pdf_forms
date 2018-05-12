class CoverLetterToJudgeProfessionalLicense < Prawn::Document

  PDF_NAME = "Cover Letter to Judge Professional License"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(Date.today.to_s, at:[38, 532], style: :bold)
      self.text_box(@client.judge_name, at:[111, 505], style: :bold)
      self.text_box(@client.judge_courtroom, at:[69, 478], style: :bold)
      self.text_box(@client.case_number, at:[329, 409], style: :bold)
      self.text_box(@client.judge_name, at:[95, 381], style: :bold)
      self.text_box(@client.first_name, at:[229, 353], style: :bold)
      self.text_box(@client.last_name, at:[360, 353], style: :bold)
      self.text_box(@client.owes_money_first_name, at:[332, 339], style: :bold)
      self.text_box(@client.owes_money_last_name, at:[37, 325], style: :bold)
    rescue
  end

  end

end
