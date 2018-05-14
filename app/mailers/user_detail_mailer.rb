class UserDetailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_detail_mailer.registration_confimation.subject
  #
  def registration_confimation(user)
    @user = user

    mail to: @user.email, subject: "Successfull Submission"
  end
  def lead_post(user)
    @user = user

    mail to: "<joshua.simon@spinircle.com>,<karthikraj@spinircle.com>,<colkar99@gmail.com>", subject: "New response for plot booking"
  end
  def payment_user(user)
  	@user = user 

  	mail to: @user.email , subject: "Payment Successfull"
  end
  def payment_Lead(user,details)
  	@user = user
  	@Payment_details = details 

  	mail to: "<joshua.simon@spinircle.com>,<karthikraj@spinircle.com>,<colkar99@gmail.com>" , subject: "Payment Successfull"
  end
end
