class AddMailingCountyToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :mailing_county, :string
  end
end
