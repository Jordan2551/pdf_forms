class AddIsPaidToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :is_paid, :boolean, default: false
  end
end
