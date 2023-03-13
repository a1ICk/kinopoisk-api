class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.user_created.subject
  #
  def user_created
    @user = params[:user]
    @greeting = "Hi"

    mail( 
      from: "support@shara.com",
      to: "shara49754@gmail.com",
      subject: "You have signed up for Shara on Ireland"
    )
  end
end
