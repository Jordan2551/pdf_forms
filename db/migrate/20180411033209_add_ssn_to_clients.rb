class AddSsnToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :ssn, :string
  end
end
