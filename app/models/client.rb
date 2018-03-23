class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
