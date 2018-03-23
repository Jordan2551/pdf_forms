class RemoveFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :petitioner
    remove_column :clients, :respondent
    remove_column :clients, :garnishee
    remove_column :clients, :name
  end
end
