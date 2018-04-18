class AddMoreStuffToBackend < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :dissolution_of_marriage, :boolean
    add_column :clients, :circuit, :string
    add_column :clients, :division, :string
    add_column :clients, :judge_name, :string
    add_column :clients, :judge_address, :string
    add_column :clients, :judge_phone_number, :string
    add_column :clients, :judge_email, :string
    add_column :clients, :judge_courtroom, :string
    add_column :clients, :owes_money_drivers_license_number, :string
    add_column :clients, :owes_money_employer_address, :string
    add_column :clients, :owes_money_employer_phone_number, :string
    add_column :clients, :owes_money_professional_license, :string
    add_column :clients, :owes_money_represented_by_council, :boolean
    add_column :clients, :owes_money_owns_assets, :boolean
    add_column :clients, :owes_money_assets, :string
    add_column :clients, :owes_money_owns_real_proprty, :boolean
    add_column :clients, :owes_money_real_proprty, :string
    add_column :clients, :folio_or_parcel_number, :string
    add_column :clients, :physical_address, :string
    add_column :clients, :owes_money_interest_in_property, :string
    add_column :clients, :monthly_cs_bi_monthly_amount, :decimal
    add_column :clients, :monthly_cs_bi_weekly_amount, :decimal
    add_column :clients, :monthly_cs_weekly_amount, :decimal
    add_column :clients, :monthly_cs_number_of_months_delinquent_child_support, :integer
    add_column :clients, :monthly_cs_date_of_last_child_support_payment, :date
    add_column :clients, :monthly_cs_amount_of_last_child_support_payment, :decimal
    add_column :clients, :monthly_cs_averages_owed_as_of, :date
    add_column :clients, :monthly_cs_averages_owed, :decimal
    add_column :clients, :monthly_alimony_bi_monthly_amount, :decimal
    add_column :clients, :monthly_alimony_bi_weekly_amount, :decimal
    add_column :clients, :monthly_alimony_weekly_amount, :decimal
    add_column :clients, :monthly_alimony_number_of_months_delinquent_child_support, :integer
    add_column :clients, :monthly_alimony_date_of_last_child_support_payment, :date
    add_column :clients, :monthly_alimony_amount_of_last_child_support_payment, :decimal
    add_column :clients, :monthly_alimony_averages_owed_as_of, :date
    add_column :clients, :monthly_alimony_averages_owed, :decimal
    add_column :clients, :monthly_alimony_cs_averages_owed_as_of, :date
    add_column :clients, :monthly_alimony_cs_averages_owed, :decimal
    add_column :clients, :attorney_fees_owed_amount, :decimal
    add_column :clients, :written_settlement_agreement_date_signed, :date
    add_column :clients, :prevailing_party_clause, :string
    add_column :clients, :written_parenting_plan_date_signed, :date
    add_column :clients, :income_withholding_order_date_signed, :date
    add_column :clients, :central_depository_address, :string
    add_column :clients, :fips_code, :string
    add_column :clients, :remittance_identifier, :boolean
    add_column :clients, :employer_ein, :string


  end
end
