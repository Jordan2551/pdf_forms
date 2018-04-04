class AddOwesMoneyLastNameToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :owes_money_middle_name, :string
  end
end
