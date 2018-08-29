class RegisterMailer < ApplicationMailer

  default from: 'slclientinfo@gmail.com'
  email_david = "david@owedsupport.com"
  email_lawrence = "lawrence@owedsupport.com"
  email_jordan = "jordan1158@gmail.com"

  def register_step_1_email(client)
    @client = client
    mail(to: "jordan1158@gmail.com", subject: 'New Support Solutions Client Application')
  end

end
