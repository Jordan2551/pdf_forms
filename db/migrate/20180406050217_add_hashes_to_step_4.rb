class AddHashesToStep4 < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    add_column :clients, :owes_money_papers, :hstore
    add_index :clients, :owes_money_papers, using: :gin
    add_column :clients, :interested_services, :hstore
    add_index :clients, :interested_services, using: :gin
    add_column :clients, :interested_documents_to_generate, :hstore
    add_index :clients, :interested_documents_to_generate, using: :gin
  end
end
