class ApplicationController < ActionController::API
  # jwt_key = Rails.application.credentials.jwt_key
before_action :authorized

  def encode_token(payload) #{ user_id: 2 }
    JWT.encode(payload, Rails.application.credentials.jwt_key) #issue a token, store payload in token
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1] #[Bearer, <token>]
          byebug

      begin
        JWT.decode(token, Rails.application.credentials.jwt_key, true, algorithm: 'HS256')
        # JWT.decode => [{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end
# Rails.application.encrypted("config/credentials.yml.enc", key_path: "config/master.key").config
  def current_user
    if decoded_token()
      user_id = decoded_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
