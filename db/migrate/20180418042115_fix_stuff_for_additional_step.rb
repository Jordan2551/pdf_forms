class FixStuffForAdditionalStep < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :owes_money_owns_real_proprty, :boolean
    remove_column :clients, :owes_money_owns_assets, :boolean
    add_column :clients, :legal_description, :boolean

  end
end
