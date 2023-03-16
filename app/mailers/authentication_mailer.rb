class AuthenticationMailer < ApplicationMailer

  def user_login
    @user = params[:user]

    mail( 
      from: "support@kinopoisk-api.com",
      to: @user.email,
      subject: "You have successfully sign in to Kinopoisk API"
    )
  end
end
