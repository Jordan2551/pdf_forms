class Pdf

  PDF_FONT_SIZE = 10
  PDF_FONT_SIZE_SMALLER = 8

  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER = "0"
  PDF_COVER_LETTER_FOR_JUDGE = "1"
  NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY = "2"
  REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE = "3"
  LEVY_INSTRUCTIONS = "4"
  ORDER_GRANTING_MOTION_FOR_BREAK_ORDER = "5"
  ORDER_GRANTING_EX_PARTE_MN_FOR_WRIT_OF_EXECUTION = "6"
  NOTICE_OF_FILING_ANSWER_OF_GARNISHEE = "7"
  NOTICE_OF_RIGHT_AGAINST_GARNISHMENT = "8"
  MOTION_FOR_INCOME_DEDUCTION_ORDER = "9"
  NOTICE_OF_FILING_CERT_MAIL_RECEIPT = "10"

  PDFS = {"Income Deduction and Wage Garnishment Judge Cover Letter" =>  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER, "Cover Letter for Judge" => PDF_COVER_LETTER_FOR_JUDGE,
    "Notice of Intent to Suspend Driver's License to other Party" => NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY,
    "Request to Clerk of ct to Send Notice" => REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE, "Levy Instructions --WIP--" => LEVY_INSTRUCTIONS,
    "Order Granting Motion for Break Order" => ORDER_GRANTING_MOTION_FOR_BREAK_ORDER, "Order Granting Ex Parte Mn for Writ of Execution" => ORDER_GRANTING_EX_PARTE_MN_FOR_WRIT_OF_EXECUTION,
    "Notice of Filing Answer of Garnishee" => NOTICE_OF_FILING_ANSWER_OF_GARNISHEE,
    "Notice of Right Against Garnishment" => NOTICE_OF_RIGHT_AGAINST_GARNISHMENT, "Motion for Income Deduction Order" => MOTION_FOR_INCOME_DEDUCTION_ORDER, "Notice of Filing Cert Mail Receipt" => NOTICE_OF_FILING_CERT_MAIL_RECEIPT}

  def self.create_pdf(pdf_id, client, settings)
    if pdf_id == PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER
      return IncomeDeductionAndWageGarnishmentJudgeCoverLetter.new(client, settings)
    elsif pdf_id == PDF_COVER_LETTER_FOR_JUDGE
      return CoverLetterForJudge.new(client, settings)
    elsif pdf_id == NOTICE_OF_INTENT_TO_SUSPEND_DRIVERS_LICENSE_TO_OTHER_PARTY
      return NoticeOfIntentToSuspendDriversLicenseToOtherParty.new(client, settings)
    elsif pdf_id == REQUEST_TO_CLERK_OF_CT_TO_SEND_NOTICE
      return RequestToClerkOfCtToSendNotice.new(client, settings)
    elsif pdf_id == LEVY_INSTRUCTIONS
      return LevyInstructions.new(client, settings)
    elsif pdf_id == ORDER_GRANTING_MOTION_FOR_BREAK_ORDER
      return OrderGrantingMotionForBreakOrder.new(client, settings)
    elsif pdf_id == ORDER_GRANTING_EX_PARTE_MN_FOR_WRIT_OF_EXECUTION
      return OrderGrantingExParteMnForWritOfExecution.new(client, settings)
    elsif pdf_id == NOTICE_OF_FILING_ANSWER_OF_GARNISHEE
      return NoticeOfFilingAnswerOfGarnishee.new(client, settings)
    elsif pdf_id == NOTICE_OF_RIGHT_AGAINST_GARNISHMENT
      return NoticeOfRightAgainstGarnishment.new(client, settings)
    elsif pdf_id == MOTION_FOR_INCOME_DEDUCTION_ORDER
      return MotionForIncomeDeductionOrder.new(client, settings)
    elsif pdf_id == NOTICE_OF_FILING_CERT_MAIL_RECEIPT
      return NoticeOfFilingCertMailReceipt.new(client, settings)
    end
  end

  #Creates all possible pdf files for the client
  def self.create_pdfs
  end

  def self.get_pdf_file_name(pdf_name, client)
    return "#{pdf_name} - #{client.first_name} #{client.last_name}.pdf"
  end

end
