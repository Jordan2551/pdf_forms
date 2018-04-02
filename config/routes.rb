Rails.application.routes.draw do

  root 'clients#home'
  get '/clients/home', to:'clients#home', as: "home"

  devise_for :users

  #Register
  get '/clients/register', to:'clients#register', as: "register_client"
  get '/clients/step_4', to:'clients#step_4', as: "step_4"
  post '/clients/register_step_1', to:'clients#register_step_1', as: "register_step_1"
  post '/clients/register_step_2', to:'clients#register_step_2', as: "register_step_2"
  post '/clients/register_step_4', to:'clients#register_step_4', as: "register_step_4"

  #Payments
  get '/clients/payment', to:'clients#payment', as: "payment"
  post '/payment/pay', to:'payment#pay', as: "pay"

  resources :clients do
    resources :pdfs
    post '/pdfs/:pdf_id/:inline', to:'pdfs#create', as: "create_pdf"
  end

  patch '/clients/ua/:user_id', to:'clients#update_admin', as: "update_admin"
  get '/application_created', to:'clients#application_created', as: "application_created"

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
