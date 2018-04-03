class AddRegistrationStepToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :registration_step, :integer, default: 1
  end
end
