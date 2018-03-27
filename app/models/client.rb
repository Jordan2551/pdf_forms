class Client < ApplicationRecord
  #Step 1
  validates :first_name, presence: true, on: :register_step_1
  validates :middle_name, presence: true, on: :register_step_1
  validates :last_name, presence: true, on: :register_step_1
  validates :phone_number, presence: true, on: :register_step_1
  validates :email, presence: true, on: :register_step_1

  #Step 2
  validates :mailing_address, presence: true, on: :register_step_2
  validates :county_name, presence: true, on: :register_step_2
  validates :alimony_child_support_required, presence: true, on: :register_step_2
  validates :home_phone_number, presence: true, on: :register_step_2
  validates :what_to_collect, presence: true, on: :register_step_2
  validates :how_much_money_owed, presence: true, on: :register_step_2
  validates :alimony_child_support_state, presence: true, on: :register_step_2

end
