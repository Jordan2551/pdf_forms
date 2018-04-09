class RemoveSomeColumnsFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :owes_money_address, :string
  end
end
