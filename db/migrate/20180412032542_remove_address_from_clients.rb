class RemoveAddressFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :address, :string
  end
end
