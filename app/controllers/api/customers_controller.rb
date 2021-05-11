class Api::CustomersController < ApplicationController

  def index
    query = params[:query] || ''
    limit = get_params(:limit, true) || 10 
    page = get_params(:page, true) || 1
    order = params[:order] === 'asc' ? 'asc' : 'desc'

    customers = Customer.where(business: current_user.business)
    .where("full_name LIKE ?", "%#{query}%").limit(limit).offset(limit * (page - 1)).order("created_at #{order}")
    count = customers.except(:limit, :offset).count
    
    query_data = {
      results: count,
      limit: limit,
      page: page,
      total_pages: (count.to_f/limit.to_f).ceil(),
    }
    
    response = { query_data: query_data, customers: customers }.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    render json: response, status: :ok
  end



  def update
    @customer = Customer.find(params[:id])
    if @customer
      @customer.update(customer_params)
      if @customer.valid?
        render json: { customer: @customer}, status: :accepted
      else
        validationErrors = @customer.errors.full_messages.uniq
        render json: { validationErrors: validationErrors}, status: :not_acceptable
      end
    else
      render status: :not_found
    end
    
  end


  def destroy
    customer = Customer.find_by(id: params[:id]) 
    if customer && customer.business === current_business
      customer.invoices.each { |invoice|  invoice.invoice_line_items.destroy_all}
      customer.invoices.destroy_all
      customer.destroy
      render  status: :accepted
    else
      render  status: :not_acceptable
    end
  end

  def show
    customer = Customer.find(params[:id])
    if customer
      render json: { customer: customer.as_json( methods: [:invoices_overview ])}, status: :ok
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
      validationErrors = @customer.errors.full_messages.uniq
      render json: { validationErrors: validationErrors}, status: :not_acceptable
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :company_name,:avatar, :email, :phone_mobile, :phone_home, :address1, :address2,:city, :state, :zip_code, :country)
  end



end
