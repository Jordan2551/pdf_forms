class AddHomePhoneNumberToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :home_phone_number, :string
  end
end
