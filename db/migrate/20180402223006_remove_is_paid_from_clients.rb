class RemoveIsPaidFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :is_paid, :boolean
  end
end
