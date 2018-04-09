class AddMoreFieldsToStep4 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :owes_money_bank_name, :string
    add_column :clients, :owes_money_account_number, :string
  end
end
