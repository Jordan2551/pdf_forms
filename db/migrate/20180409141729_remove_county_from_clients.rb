class RemoveCountyFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :county_name, :string
  end
end
