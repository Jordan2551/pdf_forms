class AddSsnAndEmancipationDateToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :child_1_ssn, :string
    add_column :clients, :child_1_emancipation_date, :date
    add_column :clients, :child_2_ssn, :string
    add_column :clients, :child_2_emancipation_date, :date
    add_column :clients, :child_3_ssn, :string
    add_column :clients, :child_3_emancipation_date, :date
    add_column :clients, :child_4_ssn, :string
    add_column :clients, :child_4_emancipation_date, :date
    add_column :clients, :child_5_ssn, :string
    add_column :clients, :child_5_emancipation_date, :date
  end
end
