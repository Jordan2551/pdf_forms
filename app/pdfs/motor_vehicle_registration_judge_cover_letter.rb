class MotorVehicleRegistrationJudgeCoverLetter < Prawn::Document

  PDF_NAME = "Motor Vehicle Registration Judge Cover Letter"

  @client
  @settings

  def initialize(client, settings)
    super(template: "#{Rails.root}/app/assets/pdfs/#{PDF_NAME}.pdf")
    self.font_size = Pdf::PDF_FONT_SIZE

    @client = client
    @settings = settings

    begin
      self.text_box(Date.today.to_s, at:[38, 530], style: :bold)
      self.text_box(@client.judge_name, at:[111, 504], style: :bold)
      self.text_box(@client.judge_courtroom, at:[225, 489], style: :bold)
      self.text_box(@client.case_number, at:[329, 420], style: :bold)
      self.text_box(@client.judge_name, at:[93, 393], style: :bold)
      self.text_box(@client.first_name, at:[228, 365], style: :bold)
      self.text_box(@client.last_name, at:[366, 365], style: :bold)
      self.text_box(@client.owes_money_first_name, at:[333, 351], style: :bold)
      self.text_box(@client.owes_money_last_name, at:[37, 337], style: :bold)
    rescue
  end

  end

end
