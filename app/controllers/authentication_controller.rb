class AuthenticationController < ActionController::API
  include JsonWebToken

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      AuthenticationMailer.with(user: @user).user_login.deliver_later
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
