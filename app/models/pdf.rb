class Pdf

  PDF_FONT_SIZE = 10
  PDF_FONT_SIZE_SMALLER = 8

  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER = "0"
  PDF_COVER_LETTER_FOR_JUDGE = "1"
  NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY = "2"
  REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE = "3"

  PDFS = {"Income Deduction and Wage Garnishment Judge Cover Letter" =>  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER, "Cover Letter for Judge" => PDF_COVER_LETTER_FOR_JUDGE, "Notice of Intent to Suspend Driver's License to other Party" => NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY, "Request to Clerk of ct to Send Notice" => REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE}

  def self.create_pdf(pdf_id, client, settings)
    if pdf_id == PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER
      return IncomeDeductionAndWageGarnishmentJudgeCoverLetter.new(client, settings)
    elsif pdf_id == PDF_COVER_LETTER_FOR_JUDGE
      return CoverLetterForJudge.new(client, settings)
    elsif pdf_id == NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY
      return NoticeOfIntentToSuspendDriversLicenseToOtherParty.new(client, settings)
    elsif pdf_id == REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE
      return RequestToClerkOfCtToSendNotice.new(client, settings)
    end
  end

  #Creates all possible pdf files for the client
  def self.create_pdfs
  end

  def self.get_pdf_file_name(pdf_name, client)
    return "#{pdf_name} - #{client.first_name} #{client.last_name}.pdf"
  end

end
