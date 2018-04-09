class AddAdditionalStuffToStep4 < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :court_order_modified, :string
    add_column :clients, :court_order_send_method, :string
    add_column :clients, :children_living_with_you, :boolean
    add_column :clients, :children_not_living_with_you_explanation, :string
  end
end
