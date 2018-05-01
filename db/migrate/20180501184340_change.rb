class Change < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :dissolution_of_marriage, :boolean
    add_column :clients, :dissolution_of_marriage, :date
  end
end
