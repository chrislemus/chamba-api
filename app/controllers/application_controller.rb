require 'json'

class ApplicationController < ActionController::API
  before_action :snake_case_params  
  before_action :authorized


  def encode_token(payload) #{ user_id: 2 }
    payload[:exp] = (15).days.from_now.to_i
    key = Rails.application.encrypted("config/credentials.yml.enc").jwt_key
    JWT.encode(payload, key) #issue a token, store payload in token
  end

  def to_camel_case(hash)
    camelize_lower = Proc.new {|a| a.camelize(:lower)}
    hash.to_json.deep_transform_keys!(&camelize_lower) 
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def get_params(parameter_symbol, is_number)
    parameter = params[parameter_symbol]
    parameter = false if parameter && is_number && !parameter.match?(/^\d+$/) 
    parameter = parameter.to_i if parameter && is_number
    parameter
  end

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1] #[Bearer, <token>]
      key = Rails.application.encrypted("config/credentials.yml.enc").jwt_key
      begin
        JWT.decode(token, key, true, algorithm: 'HS256')
        # JWT.decode => [{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end
  def current_user
    if decoded_token()
      user_id = decoded_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def current_business
    if current_user
      current_user.business || nil 
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { errors: ['Please log in'] }, status: :unauthorized unless logged_in?
  end

  private
  # snake_case the query params and all other params
  def snake_case_params
    request.parameters.deep_transform_keys!(&:underscore)
  end
  
end
