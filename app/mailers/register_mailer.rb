class RegisterMailer < ApplicationMailer

  default from: 'slclientinfo@gmail.com'

  def register_step_1_email(client, recepient)
    @client = client
    mail(to: recepient, subject: 'New Support Solutions Client Application')

  end

end
