class RemoveSendCourtOrderMethodFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :send_court_order_method, :string
  end
end
