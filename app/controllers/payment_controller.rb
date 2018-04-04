
#API Controller for making paymetns. Unlike other registration steps, this Controller
#Makes AJAX calls to the endpoint and back of the AffiniPay API

class PaymentController < ActionController::API

  include ActionController::Flash
  include Helpers

  before_action :in_session?, only: [:pay]
  helper_method :us_states

  def pay
    #Verify that step 2 has been completed
    validate_registration_stage(2)
    ap_key = Rails.application.secrets.ap_key
    ap_account_id = Rails.application.secrets.ap_account_id
    gateway = ChargeIO::Gateway.new(:secret_key => ap_key)
    amount = 75000
    charge = gateway.charge(amount, :method => params[:token_id], :account_id => ap_account_id, :type => 'card')
    if charge.errors.empty?
      Client.find(session[:client_id]).update(:registration_step => 3)
      flash[:step_3_success] = "Payment successful!"
      redirect_to step_4_path
    else
      flash[:step_3_errors] = charge.errors
      render 'pay'
    end
  end

end
