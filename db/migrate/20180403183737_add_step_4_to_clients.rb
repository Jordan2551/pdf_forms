class AddStep4ToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :alternate_contact_name, :string
    add_column :clients, :alternate_contact_phone_number, :string
    add_column :clients, :birth_date, :date
    add_column :clients, :social_security_number, :string
    add_column :clients, :gender, :boolean
    add_column :clients, :owes_money_race, :string
    add_column :clients, :owes_money_first_name, :string
    add_column :clients, :owes_money_last_name, :string
    add_column :clients, :owes_money_street, :string
    add_column :clients, :owes_money_apt, :integer
    add_column :clients, :owes_money_city, :string
    add_column :clients, :owes_money_county, :string
    add_column :clients, :owes_money_state, :string
    add_column :clients, :owes_money_zip, :string
    add_column :clients, :owes_money_work_address, :string
    add_column :clients, :owes_money_phone_number, :string
    add_column :clients, :owes_money_email, :string
    add_column :clients, :owes_money_is_in_jail, :boolean
  end
end
