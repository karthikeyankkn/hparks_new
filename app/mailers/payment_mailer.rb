class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.lead_registration.subject
  #
  def lead_registration(user)
    @user = user

    mail to: @user.email , subject: "Thanks for choosing plot with us!"
  end
  def payment_user_confirmation(user,payments)
    # binding.pry
  	 @user = user
  	 @payments = payments
  	 mail to: @user.email , subject: "Payment status"
  end
  def lead_post(user)
  	 @user = user
  	 # mail to: "<karthikeyan@spinircle.com>,<joshua.simon@spinircle.com>,<contact@getspini.com>,<sprasad@hrealty.com>,<pvijay@hrealty.com>" , subject: "Lead response"
     mail to: "<karthikeyan@spinircle.com>" , subject: "Lead response"

  end
  def payment_response_confirmation(user,payments)
  	 @user = user
  	 @payments = payments
  	 mail to: "<karthikeyan@spinircle.com>,<joshua.simon@spinircle.com>" , subject: "Lead Payment Details"
  end
  def camp_lead_response_mail(lead_details)
     @lead_details = lead_details
     mail to: "<karthikeyan@spinircle.com>,<joshua.simon@spinircle.com>,<Pvijay@hrealty.com>,<Indiamediasem@gmail.com>,<Praveentkmenon@gmail.com>" , subject: "Hiranandani Parks - Google & Facebook Hiranandani Parks"
  end
  def spini_camp_leads(lead_details)
     @lead_details = lead_details
     mail to: "<karthikeyan@spinircle.com>,<joshua.simon@spinircle.com>,<anuradha.v@spinircle.com>,<sathesh@spinircle.com>,<anand.kumar@spinircle.com>" , subject: "Spini Campaign Leads"
  end
end
