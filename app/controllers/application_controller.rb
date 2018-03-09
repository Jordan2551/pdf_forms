class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, except: [:home]

  # helper_method :authenticate_admin!

    def authenticate_admin!
      if authenticate_user! && !current_user.admin?
        flash[:forbidden => "Only accounts with the appropriate privileges are allowed access to this page"]
        render home_path
      end
    end

end
