class AddCaseNumberToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :case_number, :string
  end
end
