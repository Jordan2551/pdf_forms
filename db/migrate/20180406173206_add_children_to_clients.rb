class AddChildrenToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :child_1_first_name, :string
    add_column :clients, :child_1_last_name, :string
    add_column :clients, :child_1_birth_date, :date
    add_column :clients, :child_2_first_name, :string
    add_column :clients, :child_2_last_name, :string
    add_column :clients, :child_2_birth_date, :date
    add_column :clients, :child_3_first_name, :string
    add_column :clients, :child_3_last_name, :string
    add_column :clients, :child_3_birth_date, :date
    add_column :clients, :child_4_first_name, :string
    add_column :clients, :child_4_last_name, :string
    add_column :clients, :child_4_birth_date, :date
    add_column :clients, :child_5_first_name, :string
    add_column :clients, :child_5_last_name, :string
    add_column :clients, :child_5_birth_date, :date
  end
end
