class ApplicationController < ActionController::Base

  include Helpers
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, except: [:home]
  helper_method :authenticate_admin!
  helper_method :in_session?
  helper_method :us_states
  helper_method :countries

end
