class AddBankAddressToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :bank_address, :string
  end
end
