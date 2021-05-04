class Api::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: { customers: @customers}, status: :ok
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer
      @customer.update(customer_params)
      if @customer.valid?
        render json: { customer: @customer}, status: :accepted
      else
        errors = @customer.errors.full_messages.uniq
        render json: { errors: errors}, status: :not_acceptable
      end
    else
      render status: :not_found
    end
    
  end

  def show
    @customer = Customer.find(params[:id])
    if @customer
      render json: { customer: @customer}, status: :ok
    else
      render status: :not_found
    end
  end

  def create
    business = current_user.business
    user = current_user
    puts user.business
    puts business
    @customer = Customer.create(customer_params.merge(business: business))
    if @customer.valid?
      render json: { customer: @customer}, status: :created
    else
      errors = @customer.errors.full_messages.uniq
      render json: { errors: errors}, status: :not_acceptable
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :company_name,:avatar, :email, :phone_mobile, :phone_home, :address1, :address2,:city, :state, :zip_code, :country)
  end



end
