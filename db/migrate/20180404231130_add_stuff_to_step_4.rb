class AddStuffToStep4 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :mother_full_name, :string
    add_column :clients, :mother_maiden_name, :string
    add_column :clients, :court_order_state, :string
    add_column :clients, :court_order_county, :string
    add_column :clients, :final_judgment_obtained_date, :date
    add_column :clients, :court_case_filed_name, :string
    add_column :clients, :alternate_contact_email, :string
    add_column :clients, :alternate_contact_best_method, :string
    add_column :clients, :send_court_order_method, :string
  end
end
