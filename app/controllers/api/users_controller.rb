class Api::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    user_data = current_user.as_json( except: :password_digest)
    render json: { user:  user_data}, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      user_data = @user.as_json( except: :password_digest)
      render json: { user: user_data, token: @token }, status: :created
    else
      # errors array is filter to prevent duplicate errors. eg. password confimation error is returned twice
      errors = @user.errors.full_messages.uniq
      render json: { errors: errors}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :blocked, :email, :email_confirmation, :password, :password_confirmation)
  end
end
