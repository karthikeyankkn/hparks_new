# Preview all emails at http://localhost:3000/rails/mailers/user_detail_mailer
class UserDetailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_detail_mailer/registration_confimation
  def registration_confimation
    UserDetailMailer.registration_confimation
  end

end
