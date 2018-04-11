class Client < ApplicationRecord
  #Step 1
  validates :first_name, presence: true, on: :register_step_1
  validates :middle_name, presence: true, on: :register_step_1
  validates :last_name, presence: true, on: :register_step_1
  validates :phone_number, presence: true, on: :register_step_1
  validates :email, presence: true, format: { with: Devise.email_regexp, message: "Invalid email format"}, on: :register_step_1

  #Step 2
  validates :mailing_address, presence: true, on: :register_step_2
  validates :mailing_city, presence: true, on: :register_step_2
  validates :mailing_country, presence: true, on: :register_step_2
  validates :alimony_child_support_required, presence: true, on: :register_step_2
  validates :home_phone_number, presence: true, on: :register_step_2
  validates :what_to_collect, presence: true, on: :register_step_2
  validates :how_much_money_owed, presence: true, numericality: {greater_than_or_equal_to: 5000, message: "You must be owed at least $5,000.00 to proceed to the next step."}, on: :register_step_2
  validates :alimony_child_support_state, presence: true, on: :register_step_2

  #Step 4
  validates :owes_money_race, presence: true, on: :register_step_4
  validates :owes_money_birth_date, presence: true, on: :register_step_4
  validates :owes_money_first_name, presence: true, on: :register_step_4
  validates :owes_money_gender, presence: true, on: :register_step_4
  validates :owes_money_last_name, presence: true, on: :register_step_4
  validates :owes_money_address, presence: true, on: :register_step_4
  validates :owes_money_apt, presence: true, on: :register_step_4
  validates :owes_money_city, presence: true, on: :register_step_4
  validates :owes_money_occupation, presence: true, on: :register_step_4
  validates :owes_money_race, presence: true, on: :register_step_4
  validates :owes_money_state, presence: true, on: :register_step_4
  validates :owes_money_ssn, presence: true, on: :register_step_4
  validates :owes_money_is_in_jail, presence: true, on: :register_step_4
  validates :mother_full_name, presence: true, on: :register_step_4
  validates :mother_maiden_name, presence: true, on: :register_step_4
  validates :case_number, presence: true, on: :register_step_4
  validates :ssn, presence: true, on: :register_step_4
  validates :court_order_modified, presence: true, on: :register_step_4
  validates :documentation_send_method, presence: true, on: :register_step_4
  validates :court_order_state, presence: true, on: :register_step_4
  validates :court_order_county, presence: true, on: :register_step_4
  validates :final_judgment_obtained_date, presence: true, on: :register_step_4
  validates :court_case_filed_name, presence: true, on: :register_step_4
  validates :child_1_first_name, presence: true, on: :register_step_4
  validates :child_1_last_name, presence: true, on: :register_step_4
  validates :child_1_birth_date, presence: true, on: :register_step_4
  validates :children_living_with_you, presence: true, on: :register_step_4
  validates :liquidated_damages_amount, presence: true, on: :register_step_4
  validates :prejudgment_interest_amount, presence: true, on: :register_step_4
  validates :taxable_court_costs_amount, presence: true, on: :register_step_4
  validates :first_class_mailing_receipt_number, presence: true, on: :register_step_4
  validates :certified_mailing_receipt_number, presence: true, on: :register_step_4
  validates :mailing_date, presence: true, on: :register_step_4


end
