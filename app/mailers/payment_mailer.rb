class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.lead_registration.subject
  #
  def lead_registration(user)
    @user = user

    mail to: @user.email , subject: "Thanks for registration"
  end
  def payment_user_confirmation(details)
  	 @details = details
  	 mail to: @details.email , subject: "Payment status"
  end
  def lead_post(user)
  	 @user = user
  	 mail to: "<colkar99@gmail.com>,<karthikraj@spinircle.com>" , subject: "Lead response"
  end
  def payment_response_confirmation(user,payments)
  	 @user = user
  	 @payments = payments
  	 mail to: "<colkar99@gmail.com>,<karthikraj@spinircle.com>" , subject: "Lead Payment Details"
  end
end
