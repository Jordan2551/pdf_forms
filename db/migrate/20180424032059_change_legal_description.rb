class ChangeLegalDescription < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :legal_description, :boolean
    add_column :clients, :legal_description, :string
  end
end
