class RemoveMailingAddressFromClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :mailing_city, :string
    add_column :clients, :mailing_state, :string
    add_column :clients, :mailing_zip, :string
    add_column :clients, :mailing_country, :string
  end
end
