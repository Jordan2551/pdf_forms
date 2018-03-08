json.extract! client, :id, :petitioner, :respondent, :garnishee, :name, :address, :bank_name, :created_at, :updated_at
json.url client_url(client, format: :json)
