class UserMailer < ApplicationMailer
	
	default from:  "gurjot21@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  
  def signup_confirmation(user)
    @user= user
    debugger
    mail to: @user.email , subject: "MovieBox Sign Up Confirmation"
    
  end


  def weekly_mails(user)
    mail to: user.email , subject: "MovieBox Weekly Mails"
  
  end
end
