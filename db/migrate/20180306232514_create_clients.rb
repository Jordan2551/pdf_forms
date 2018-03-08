class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :petitioner
      t.string :respondent
      t.string :garnishee
      t.string :name
      t.string :address
      t.string :bank_name

      t.timestamps
    end
  end
end
