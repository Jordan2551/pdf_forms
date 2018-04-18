# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180418042115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "clients", force: :cascade do |t|
    t.string "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_address"
    t.string "case_number"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "mailing_address"
    t.string "work_phone_number"
    t.boolean "alimony_child_support_required"
    t.string "alimony_child_support_state"
    t.integer "what_to_collect"
    t.decimal "how_much_money_owed"
    t.boolean "receiving_payments"
    t.boolean "receiving_public_assistance"
    t.string "receiving_public_assistance_description"
    t.string "home_phone_number"
    t.integer "registration_step", default: 1
    t.string "alternate_contact_name"
    t.string "alternate_contact_phone_number"
    t.date "birth_date"
    t.string "owes_money_race"
    t.string "owes_money_first_name"
    t.string "owes_money_last_name"
    t.integer "owes_money_apt"
    t.string "owes_money_city"
    t.string "owes_money_county"
    t.string "owes_money_state"
    t.string "owes_money_zip"
    t.string "owes_money_work_address"
    t.string "owes_money_phone_number"
    t.string "owes_money_email"
    t.boolean "owes_money_is_in_jail"
    t.string "gender"
    t.string "owes_money_middle_name"
    t.string "mother_full_name"
    t.string "mother_maiden_name"
    t.string "court_order_state"
    t.string "court_order_county"
    t.date "final_judgment_obtained_date"
    t.string "court_case_filed_name"
    t.string "alternate_contact_email"
    t.string "alternate_contact_best_method"
    t.string "owes_money_first_nickname"
    t.string "owes_money_last_nickname"
    t.string "owes_money_country"
    t.string "owes_money_occupation"
    t.date "owes_money_birth_date"
    t.string "owes_money_ssn"
    t.string "owes_money_work_phone_number"
    t.string "owes_money_work_city"
    t.string "owes_money_work_state"
    t.string "owes_money_work_zip"
    t.string "interested_services_details"
    t.integer "liquidated_damages_amount"
    t.integer "prejudgment_interest_amount"
    t.integer "taxable_court_costs_amount"
    t.string "first_class_mailing_receipt_number"
    t.string "certified_mailing_receipt_number"
    t.date "mailing_date"
    t.string "account_number"
    t.date "filing_date"
    t.hstore "owes_money_papers"
    t.hstore "interested_services"
    t.hstore "interested_documents_to_generate"
    t.string "suffix"
    t.string "child_1_first_name"
    t.string "child_1_last_name"
    t.date "child_1_birth_date"
    t.string "child_2_first_name"
    t.string "child_2_last_name"
    t.date "child_2_birth_date"
    t.string "child_3_first_name"
    t.string "child_3_last_name"
    t.date "child_3_birth_date"
    t.string "child_4_first_name"
    t.string "child_4_last_name"
    t.date "child_4_birth_date"
    t.string "child_5_first_name"
    t.string "child_5_last_name"
    t.date "child_5_birth_date"
    t.string "mailing_city"
    t.string "mailing_state"
    t.string "mailing_zip"
    t.string "mailing_country"
    t.string "mailing_county"
    t.string "owes_money_bank_name"
    t.string "owes_money_account_number"
    t.string "court_order_modified"
    t.boolean "children_living_with_you"
    t.string "children_not_living_with_you_explanation"
    t.string "documentation_send_method"
    t.string "owes_money_gender"
    t.string "owes_money_address"
    t.string "ssn"
    t.string "child_1_ssn"
    t.date "child_1_emancipation_date"
    t.string "child_2_ssn"
    t.date "child_2_emancipation_date"
    t.string "child_3_ssn"
    t.date "child_3_emancipation_date"
    t.string "child_4_ssn"
    t.date "child_4_emancipation_date"
    t.string "child_5_ssn"
    t.date "child_5_emancipation_date"
    t.boolean "dissolution_of_marriage"
    t.string "circuit"
    t.string "division"
    t.string "judge_name"
    t.string "judge_address"
    t.string "judge_phone_number"
    t.string "judge_email"
    t.string "judge_courtroom"
    t.string "owes_money_drivers_license_number"
    t.string "owes_money_employer_address"
    t.string "owes_money_employer_phone_number"
    t.string "owes_money_professional_license"
    t.boolean "owes_money_represented_by_council"
    t.string "owes_money_assets"
    t.string "owes_money_real_proprty"
    t.string "folio_or_parcel_number"
    t.string "physical_address"
    t.string "owes_money_interest_in_property"
    t.decimal "monthly_cs_bi_monthly_amount"
    t.decimal "monthly_cs_bi_weekly_amount"
    t.decimal "monthly_cs_weekly_amount"
    t.integer "monthly_cs_number_of_months_delinquent_child_support"
    t.date "monthly_cs_date_of_last_child_support_payment"
    t.decimal "monthly_cs_amount_of_last_child_support_payment"
    t.date "monthly_cs_averages_owed_as_of"
    t.decimal "monthly_cs_averages_owed"
    t.decimal "monthly_alimony_bi_monthly_amount"
    t.decimal "monthly_alimony_bi_weekly_amount"
    t.decimal "monthly_alimony_weekly_amount"
    t.integer "monthly_alimony_number_of_months_delinquent_child_support"
    t.date "monthly_alimony_date_of_last_child_support_payment"
    t.decimal "monthly_alimony_amount_of_last_child_support_payment"
    t.date "monthly_alimony_averages_owed_as_of"
    t.decimal "monthly_alimony_averages_owed"
    t.date "monthly_alimony_cs_averages_owed_as_of"
    t.decimal "monthly_alimony_cs_averages_owed"
    t.decimal "attorney_fees_owed_amount"
    t.date "written_settlement_agreement_date_signed"
    t.string "prevailing_party_clause"
    t.date "written_parenting_plan_date_signed"
    t.date "income_withholding_order_date_signed"
    t.string "central_depository_address"
    t.string "fips_code"
    t.boolean "remittance_identifier"
    t.string "employer_ein"
    t.boolean "legal_description"
    t.index ["interested_documents_to_generate"], name: "index_clients_on_interested_documents_to_generate", using: :gin
    t.index ["interested_services"], name: "index_clients_on_interested_services", using: :gin
    t.index ["owes_money_papers"], name: "index_clients_on_owes_money_papers", using: :gin
  end

  create_table "settings", force: :cascade do |t|
    t.string "jc_number"
    t.string "county_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
