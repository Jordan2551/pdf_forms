class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :jc_number
      t.string :county_name

      t.timestamps
    end
  end
end
