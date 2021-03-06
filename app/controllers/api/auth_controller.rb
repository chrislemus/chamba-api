class Api::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    puts params[:test_name]
    @user = User.find_by(email: user_login_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      user_data = @user.as_json(except: :password_digest, methods: [:full_name ])
      render json: { user: user_data, token: token }, status: :accepted
    else
      render json: { validationErrors: ['Invalid email or password'] }, status: :unauthorized
    end
  end

  private

  def user_login_params
    # params { user: {email: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:email, :password)
  end
end
