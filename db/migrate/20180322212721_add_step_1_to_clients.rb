class AddStep1ToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :middle_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :email, :string
  end
end
