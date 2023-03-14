class RegistrationMailer < ApplicationMailer
  def user_created
    @user = params[:user]

    mail( 
      from: "support@kinopoisk-api.com",
      to: @user.email,
      subject: "You have successfully sign up to Kinopoisk API"
    )
  end
end
