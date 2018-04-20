class Pdf

  PDF_FONT_SIZE = 10

  PDF_TEST_DOC = "0"
  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER = "1"

  PDFS = {"testdoc" => PDF_TEST_DOC, "Income Deduction and Wage Garnishment Judge Cover Letter" =>  PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER}

  def self.create_pdf(pdf_id, client, settings)
    if pdf_id == PDF_TEST_DOC
      return TestPdf.new(client, settings)
    elsif pdf_id == PDF_INCOME_DEDUCTION_AND_WAGE_GARNISHMENT_JUDGE_COVER_LETTER
      return IncomeDeductionAndWageGarnishmentJudgeCoverLetter.new(client, settings)
    end
  end

  #Creates all possible pdf files for the client
  def self.create_pdfs
  end

end
