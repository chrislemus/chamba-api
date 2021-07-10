class Api::EventsController < ApplicationController
  def index
    if params[:date] && params[:days]
      start_date = DateTime.parse( params[:date]).beginning_of_day
      end_date = start_date + (params[:days].to_i ).days
      end_date = end_date.end_of_day
      events_container = params[:customer_id] ? Customer.find(params[:customer_id]) : current_business
      events = events_container.events.includes(:customer).where("start_date >= ? AND start_date <= ?", start_date, end_date).order("start_date asc")
      response = { 
        events: events.as_json( except: :customer_id, include: [:customer]) 
      }.deep_transform_keys { |key| key.to_s.camelize(:lower) }
      render json: response, status: :ok
    else
       render json: { error: '"date" must be a date string and "days" must be a integer representing the number of days of events requested'}, status: :not_acceptable
    end
  end

  def destroy
    event = Event.find(params[:id]) 
    if event && event.business === current_business
      event.destroy
      render  status: :accepted
    else
      render status: :not_acceptable
    end
  end

  def update
    event = Event.find(params[:id]) 
    if event && event.business === current_business
      event.update(event_params)
      if event.valid?
        data = {
          event: event.as_json( except: :customer_id, include: [:customer]) 
         }
        render json: data, status: :accepted
      else
        validationErrors = event.errors.full_messages.uniq
        render json: { validationErrors: validationErrors}, status: :not_acceptable
      end
    else
      render status: :not_found
    end
  end


  def show
    event =current_business.events.find(params[:id])
    data = {
      event: event.as_json( except: :customer_id, include: [:customer]) 
    }
    if event
      render json: data,  status: :ok
    else
      render status: :not_found
    end
  end

  def create
    event = Event.new(event_params)
    event.user = current_user
    event.save
    if event.valid?
      render json: { event: event.as_json( except: :customer_id, include: [:customer])  }, status: :created
    else
      validationErrors = event.errors.full_messages.uniq
      render json: { validationErrors: validationErrors}, status: :not_acceptable
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :customer_id, :location, :notes )
  end

end
