class CalendarEventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    reservations = Reservation.all
    logger.debug("TESTING INDEXING")
    render json: reservations.map do |reservation|
      {
        id: reservation.id,
        start_date: reservation.start_time.to_formatted_s(:db),
        end_date: reservation.end_time.to_formatted_s(:db),
        text: reservation.user.name
      }
    end
  end

  def create
    reservation = Reservation.new(
      start_time: params['start_date'],
      end_time: params['end_date'],
      user_id: User.last.id
    )
    logger.info "Saved: #{reservation.save}"
    logger.info "Created reservation #{reservation.inspect}"
    render json: { action: 'inserted', tid: reservation.id }
  end

  def update
    reservation = Reservation.find(params['id'])
    reservation.start_time = params['start_date']
    reservation.end_time = params['end_date']
    reservation.save

    render json: { action: 'updated' }
  end

  def destroy
    Reservation.find(params['id']).destroy

    render json: { action: 'deleted' }
  end
end
