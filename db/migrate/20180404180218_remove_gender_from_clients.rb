class RemoveGenderFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :gender, :boolean
    remove_column :clients, :social_security_number, :string
  end
end
