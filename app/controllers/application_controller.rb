class ApplicationController < ActionController::Base

  include Helpers
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, except: [:home]
  helper_method :authenticate_admin!
  helper_method :in_session?
  helper_method :owes_money_papers
  helper_method :interested_services
  helper_method :interested_documents_to_generate
  helper_method :us_states
  helper_method :countries
  helper_method :suffixes
  helper_method :provinces
end
