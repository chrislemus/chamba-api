class Api::InvoicesController < ApplicationController
  def index



    
    query = params[:query] || ''
    limit = get_params(:limit, true) || 10 
    page = get_params(:page, true) || 1
    order = params[:order] === 'asc' ? 'asc' : 'desc'

    # User.includes(:posts).where('posts.name = ?', 'example')

    business = Business.find(current_user.business.id)
    invoices = Invoice.all
    # invoices.collect{ |invoices| invoices.customer.first_name }
    # invoices = business.invoices.joins(:customer).includes(:customer)
    # invoices = business.invoices.joins(:customer)
    # .limit(limit).offset(limit * (page - 1)).order("created_at #{order}")
    # count = invoices.except(:limit, :offset).count
    
    query_data = {
      # results: count,
      # limit: limit,
      # page: page,
      # total_pages: (count.to_f/limit.to_f).ceil()
    }
    
    response = { 
      query_data: query_data, 
      invoices: invoices.as_json(include: [:customer, :invoice_line_items]) 
    }.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    
    render json: response, status: :ok
    # query = params[:query] || ''
    # limit = get_params(:limit, true) || 10 
    # page = get_params(:page, true) || 1
    # order = params[:order] === 'asc' ? 'asc' : 'desc'

    # customers = Customer.where("full_name LIKE ?", "%#{query}%").limit(limit).offset(limit * (page - 1)).order("created_at #{order}")
    # count = customers.except(:limit, :offset).count

    # query_data = {
    #   results: count,
    #   limit: limit,
    #   page: page,
    #   total_pages: (count.to_f/limit.to_f).ceil(),
    #   test_key: {
    #     first_name: 'hi'
    #   }
    # }
    
    # response = { query_data: query_data, customers: customers }.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    # render json: response, status: :ok
  end
#   {
#     "user": {
#         "id": 1,
#         "firstName": "Chris",
#         "lastName": "Lemus",
#         "businessName": "ACME LLC",
#         "avatar": null,
#         "email": "me@me.com",
#         "blocked": false,
#         "createdAt": "2021-05-05T19:39:27.612Z",
#         "updatedAt": "2021-05-05T19:39:27.612Z"
#     }
# }



  # def update
  #   @customer = Customer.find(params[:id])
  #   if @customer
  #     @customer.update(customer_params)
  #     if @customer.valid?
  #       render json: { customer: @customer}, status: :accepted
  #     else
  #       validationErrors = @customer.errors.full_messages.uniq
  #       render json: { validationErrors: validationErrors}, status: :not_acceptable
  #     end
  #   else
  #     render status: :not_found
  #   end
    
  # end

  # def show
  #   @customer = Customer.find(params[:id])
  #   if @customer
  #     render json: { customer: @customer}, status: :ok
  #   else
  #     render status: :not_found
  #   end
  # end

  def create


    invoice = Invoice.create(invoice_params)
    # puts  invoice.errors.full_messages.uniq
    # line_items = invoice.invoice_line_items.build(params[:invoice_line_items_attributes])
    # # invoice.invoice_line_items.save
    # line_items.save
    # invoice.save
    # invoice_line_item = InvoiceLineItem.create(invoice_params)

    # if @customer.valid?
    #   render json: { customer: @customer}, status: :created
    # else
    #   validationErrors = @customer.errors.full_messages.uniq
      render json: { invoices: invoice.as_json(include: [ :invoice_line_items]) }, status: :not_acceptable
    # end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, invoice_line_items_attributes: [:description, :price] )
  end

end
