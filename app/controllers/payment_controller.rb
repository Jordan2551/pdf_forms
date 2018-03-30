
class PaymentController < ActionController::API

  include ActionController::Flash

  # TODO: add secrets to env
  # TODO: test additional errors and handle their messages in the step_3 view

  def pay

    gateway = ChargeIO::Gateway.new(:secret_key => "xzw7tjxtS3egdUwMveTbeAjnuQvJNF7RrxMBYuCqqWfdrzUoGgixmd2lquOw7RNj")
    amount = 75000
    charge = gateway.charge(amount, :method => params[:token_id], :account_id => "iRDOjvNfQEeusMLBWqQJLQ", :type => 'card')

    if !charge.errors.empty?
      flash[:errors] = charge.errors
      redirect_to home_path
    else
      #ADD REDIRECT TO THE FINAL REGISTRATION STEP WITH A MESSAGE
      flash[:success] = "Payment successful!"
      redirect_to home_path
    end

  end

end
