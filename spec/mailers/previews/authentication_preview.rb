# Preview all emails at http://localhost:3000/rails/mailers/authentication
class AuthenticationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/authentication/user_login
  def user_login
    AuthenticationMailer.user_login
  end

end
