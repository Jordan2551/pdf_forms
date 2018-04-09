class RemoveOwesMoneyWorkSteetFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :owes_money_work_street, :string
  end
end
