class ChangeWhatToCollectFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :what_to_collect, :integer
    add_column :clients, :what_to_collect, :string
  end
end
