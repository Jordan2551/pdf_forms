class AddStep2 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :mailing_address, :string
    add_column :clients, :work_phone_number, :string
    add_column :clients, :county_name, :string
    add_column :clients, :alimony_child_support_required, :boolean
    add_column :clients, :alimony_child_support_state, :string
    add_column :clients, :what_to_collect, :integer
    add_column :clients, :how_much_money_owed, :decimal
    add_column :clients, :receiving_payments, :boolean
    add_column :clients, :receiving_public_assistance, :boolean
    add_column :clients, :receiving_public_assistance_description, :string
  end
end
