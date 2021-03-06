class Api::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    user_data = current_user.as_json( except: :password_digest, methods: [:full_name ])
    render json: { user:  user_data}, status: :accepted
  end

  def create
    user = User.new(user_params)
    @business = Business.new(name: user[:business_name], owner: user)
    if user.valid? && @business.valid? 
      user.save
      @business.save
      @token = encode_token({ user_id: user.id })
      user_data = user.as_json( except: :password_digest, methods: [:full_name ])
      render json: { user: user_data, token: @token }, status: :created
    else
      validationErrors = user.errors.full_messages.uniq
      render json: { validationErrors: validationErrors}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :business_name, :email, :email_confirmation, :password, :password_confirmation)
  end



end
