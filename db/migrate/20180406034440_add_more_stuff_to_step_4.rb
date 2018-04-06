class AddMoreStuffToStep4 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :owes_money_first_nickname, :string
    add_column :clients, :owes_money_last_nickname, :string
    add_column :clients, :owes_money_country, :string
    add_column :clients, :owes_money_occupation, :string
    add_column :clients, :owes_money_birth_date, :date
    add_column :clients, :owes_money_ssn, :string
    add_column :clients, :owes_money_work_phone_number, :string
    add_column :clients, :owes_money_work_street, :string
    add_column :clients, :owes_money_work_city, :string
    add_column :clients, :owes_money_work_state, :string
    add_column :clients, :owes_money_work_zip, :string
    add_column :clients, :owes_money_have_papers, :hstore
    add_column :clients, :interested_services, :hstore
    add_column :clients, :interested_documents_generate, :hstore
    add_column :clients, :interested_services_details, :string
    add_column :clients, :liquidated_damages_amount, :integer
    add_column :clients, :prejudgment_interest_amount, :integer
    add_column :clients, :taxable_court_costs_amount, :integer
    add_column :clients, :first_class_mailing_receipt_number, :string
    add_column :clients, :certified_mailing_receipt_number, :string
    add_column :clients, :mailing_date, :date
    add_column :clients, :account_number, :string
    add_column :clients, :filing_date, :date
  end
end
