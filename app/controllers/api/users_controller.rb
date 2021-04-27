class Api::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    user_data = current_user.as_json( except: :password_digest)
    render json: { user:  user_data}, status: :accepted
  end

  def create
    #create business & check if valid OR return error
    
    # if @business.valid?
    #   #gotta create default role table
      
    #   params[:user][:role] = owner
    # else
    #   errors = @business.errors.full_messages.uniq
    #   return render json: { errors: errors}, status: :not_acceptable
    # end


    # if params[:user] && params[:business]
    #   params[:user][:is_owner] = true
    # end

    
    # @owner_role = nil
    # @user.valid?
    # errors = @user.errors.to_hash(full_messages = true).without(:role).values

    # @business = Business.new(business_params)
    # if !@business.valid?
    #   errors << @business.errors.full_messages.map { |err| 'Business ' + err }
    # end

    # if @user.valid? && @business.valid?
    #   @owner_role = Role.new(business: @business) 
    #   if @owner_role.valid?
    #     @user.role = @owner_role
    #   else
    #      errors << @owner_role.errors.full_messages
    #   end
    # end
 
    # errors = errors.flatten.uniq if errors.length > 0
     

    @user = User.new(user_params)
    @business = Business.new(name: @user[:business_name], owner: @user)
    if @user.valid? && @business.valid? 
      @user.save
      @business.save
      @token = encode_token({ user_id: @user.id })
      user_data = @user.as_json( except: :password_digest)
      render json: { user: user_data, token: @token }, status: :created
    else
      errors = @user.errors.full_messages.uniq
      render json: { errors: errors}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :business_name, :email, :email_confirmation, :password, :password_confirmation)
  end



end
