class Api::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: { customers: @customers}, status: :ok
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    render json: { customers: @customers}, status: :accepted
  end

  def show

    @customer = Customer.find(params[:id])
    render json: { customer: @customer}, status: :ok
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
    params.require(:customer).permit(:first_name, :last_name, :company_name,:avatar, :email, :phone_mobile, :phone_home, :address_1, :address_2,:city, :state, :zip_code, :country)
  end



end
