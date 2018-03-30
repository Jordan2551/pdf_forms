
class PaymentController < ActionController::API

  include ActionController::Flash

  def pay

    ap_key = Rails.application.secrets.ap_key
    ap_account_id = Rails.application.secrets.ap_account_id

    gateway = ChargeIO::Gateway.new(:secret_key => ap_key)
    amount = 75000
    charge = gateway.charge(amount, :method => params[:token_id], :account_id => ap_account_id, :type => 'card')

    if !charge.errors.empty?
      flash[:errors] = charge.errors
      redirect_to home_path
      #We need to make this render. The resource is not found if we do render.
    else
      #ADD REDIRECT TO THE FINAL REGISTRATION STEP WITH A MESSAGE
      flash[:success] = "Payment successful!"
      redirect_to home_path
    end

    # respond_to do |format|
    #   if !charge.errors.empty?
    #     format.js{
    #       flash[:errors] = charge.errors
    #       render 'home'
    #     }
    #   else
    #     format.js{
    #       #ADD REDIRECT TO THE FINAL REGISTRATION STEP WITH A MESSAGE
    #       flash[:success] = "Payment successful!"
    #       redirect_to home_path
    #     }
    #   end
    # end

  end

end
