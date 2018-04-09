class AddOwesMoneyGenderToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :owes_money_gender, :string
  end
end
