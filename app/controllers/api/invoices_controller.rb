class Api::InvoicesController < ApplicationController
  def index
    query = params[:query] || ''
    limit = get_params(:limit, true) || 10 
    page = get_params(:page, true) || 1
    order = params[:order] === 'asc' ? 'asc' : 'desc'

    invoices = current_business.invoices.includes(:invoice_line_items)
    .limit(limit).offset(limit * (page - 1)).order("created_at #{order}")

    count = invoices.except(:limit, :offset).count
    
    query_data = {
      results: count,
      limit: limit,
      page: page,
      total_pages: (count.to_f/limit.to_f).ceil()
    }
    
    response = { 
      query_data: query_data, 
      invoices: invoices.as_json( methods: [:total, :status, :customer_full_name]) 
    }.deep_transform_keys { |key| key.to_s.camelize(:lower) }

    render json: response, status: :ok

  end

  def destroy
    invoice = Invoice.find_by(id: params[:id]) 
    if invoice && invoice.customer.business === current_business
      invoice.invoice_line_items.destroy_all
      invoice.destroy
      render  status: :accepted
    else
      render json: { validationErrors: validationErrors}, status: :not_acceptable
    end
  end

  def update
    invoice = Invoice.find_by(id: params[:id]) 
    if invoice && invoice.customer.business === current_business
      invoice.update(invoice_params)
      if invoice.valid?
        render json: { invoice: invoice}, status: :accepted
      else
        validationErrors = invoice.errors.full_messages.uniq
        render json: { validationErrors: validationErrors}, status: :not_acceptable
      end
    else
      render status: :not_found
    end
  end


  def show
    invoice =current_business.invoices.find(params[:id])
    data = {
      invoice: invoice.as_json(include: [:customer, :invoice_line_items], methods: [:total, :status, :business_name])
    }
    if invoice
      render json: data,  status: :ok
    else
      render status: :not_found
    end
  end

  def create
    invoice = Invoice.create(invoice_params)
    if invoice.valid?
      render json: { invoice: invoice.as_json(include: [ :invoice_line_items]) }, status: :created
    else
      validationErrors = invoice.errors.full_messages.uniq
      render json: { validationErrors: validationErrors}, status: :not_acceptable
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id,:paid_date,:due_date, :canceled_date, invoice_line_items_attributes: [:id, :name, :description, :price, :_destroy] )
  end

end
