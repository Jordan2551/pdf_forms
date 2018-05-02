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
    rescue
  end

  end

end
