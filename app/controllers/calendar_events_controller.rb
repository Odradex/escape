class CalendarEventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_parameters

  def index
    logger.info "INDEXING EVENTS"
    current_organization_id = params[:organization_id]
    gon.organization_id = params['id']
    gon.use_mode = current_user.customer? ? 'customer' : 'manager'
    events = Event.where(organization_id: current_organization_id).eager_load(reservation: :services)
    events = events.map do |event|
      {
        id: event.id,
        start_date: event.start_date.to_formatted_s(:db),
        end_date: event.end_date.to_formatted_s(:db),
        text: event.text,
        rec_type: event.rec_type,
        event_length: event.event_length,
        event_pid: event.event_pid,
        user_id: event.reservation.user_id,
        room_id: event.reservation.room_id,
        services: event.reservation.service_ids
      }
    end
    render json: events
  end

  def create
    logger.info "CREATING EVENT FOR #{@organization_id}"
    event = Event.create start_date: @start_date, end_date: @end_date,
                         text: @text, rec_type: @rec_type,
                         event_length: @event_length, event_pid: @event_pid, organization_id: @organization_id
    @reservation = Reservation.create user_id: @user_id, room_id: @room_id, event: event, service_ids: @services
    event.reservation = @reservation
    event.save!
    @tid = event.id
    @mode = 'deleted' if @rec_type == 'none'
  end

  def update
    Event.where(event_pid: @id).destroy_all if @rec_type != ''

    event = Event.eager_load(:reservation).find(@id)
    event.start_date = @start_date
    event.end_date = @end_date
    event.text = @text
    event.rec_type = @rec_type
    event.event_length = @event_length
    event.event_pid = @event_pid
    event.reservation.user_id = @user_id
    event.reservation.room_id = @room_id
    event.reservation.service_ids = @services
  end

  def destroy
    Event.where(event_pid: @id).destroy_all if @rec_type != ''

    if @event_pid != 0 && @event_pid != ''
      event = Event.find(@id)
      event.rec_type = 'none'
      event.save
    else
      Event.find(@id).destroy
    end
  end

  private

  def set_parameters
    @mode = params['!nativeeditor_status']
    @id = params['id']
    @start_date = params['start_date']
    @end_date = params['end_date']
    @text = params['text']
    @rec_type = params['rec_type']
    @event_length = params['event_length']
    @event_pid = params['event_pid']
    @user_id = params['user_id']
    @room_id = params['room_id']
    @services = params['services'].split(',').map(&:to_i) if params['services']
    @organization_id = params['organization_id']
    @tid = @id
  end

  def render_json_response
    render json: {
      type: @mode,
      sid: @id,
      tid: @tid
    }
  end
end
