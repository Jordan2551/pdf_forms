class AddAdditionalStuffToStep42 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :documentation_send_method, :string
    remove_column :clients, :court_order_send_method, :string
  end
end
