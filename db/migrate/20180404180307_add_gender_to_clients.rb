class AddGenderToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :gender, :string
  end
end
