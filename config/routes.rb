Rails.application.routes.draw do

  root 'clients#index'
  resources :clients do
    resources :pdfs
    post '/pdfs/:id', to:'pdfs#create', as: "create_pdf"
  end

  get '/settings', to:'settings#edit', as: "edit_settings"
  patch '/settings', to:'settings#update', as: "update_settings"

  #For creating all pdfs for user at once
  # post '/pdfs/:id', to:'pdfs#create_pdfs', as: "create_pdfs"
  #
  # #For creating a single pdf on the spot. We need the pdf id for the controller
  # post '/pdfs/:id/', to:'pdfs#create', as: "create_pdf"
  #
  # #For showing a list of all pdfs for the user
  # get '/pdfs/:id', to:'pdfs#index', as: "index_pdfs"

end
