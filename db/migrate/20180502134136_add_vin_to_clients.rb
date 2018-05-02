class AddVinToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :vin, :string
  end
end
