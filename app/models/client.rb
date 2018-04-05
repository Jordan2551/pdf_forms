class Client < ApplicationRecord
  #Step 1
  validates :first_name, presence: true, on: :register_step_1
  validates :middle_name, presence: true, on: :register_step_1
  validates :last_name, presence: true, on: :register_step_1
  validates :phone_number, presence: true, on: :register_step_1
  validates :email, presence: true, format: { with: Devise.email_regexp, message: "Invalid email format"}, on: :register_step_1

  #Step 2
  validates :mailing_address, presence: true, on: :register_step_2
  validates :county_name, presence: true, on: :register_step_2
  validates :alimony_child_support_required, presence: true, on: :register_step_2
  validates :home_phone_number, presence: true, on: :register_step_2
  validates :what_to_collect, presence: true, on: :register_step_2
  validates :how_much_money_owed, presence: true, numericality: {greater_than_or_equal_to: 5000, message: "You must be owed at least $5,000.00 to proceed to the next step."}, on: :register_step_2
  validates :alimony_child_support_state, presence: true, on: :register_step_2

  #Step 4
  validates :birth_date, presence: true, on: :register_step_4
  validates :gender, presence: true, on: :register_step_4
  validates :owes_money_race, presence: true, on: :register_step_4
  validates :owes_money_first_name, presence: true, on: :register_step_4
  validates :owes_money_middle_name, presence: true, on: :register_step_4
  validates :owes_money_last_name, presence: true, on: :register_step_4
  validates :owes_money_street, presence: true, on: :register_step_4
  validates :owes_money_apt, presence: true, on: :register_step_4
  validates :owes_money_city, presence: true, on: :register_step_4
  validates :owes_money_state, presence: true, on: :register_step_4
  validates :owes_money_email, format: { with: Devise.email_regexp, message: "Invalid email format"}, on: :register_step_4
  validates :owes_money_is_in_jail, presence: true, on: :register_step_4
  validates :mother_full_name, presence: true, on: :register_step_4
  validates :mother_maiden_name, presence: true, on: :register_step_4
  validates :court_order_state, presence: true, on: :register_step_4
  validates :court_order_county, presence: true, on: :register_step_4
  validates :final_judgment_obtained_date, presence: true, on: :register_step_4
  validates :court_case_filed_name, presence: true, on: :register_step_4
  validates :alternate_contact_email, format: { with: Devise.email_regexp, message: "Invalid email format"}, on: :register_step_4
  validates :send_court_order_method, presence: true, on: :register_step_4


end
