class ReservationDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      user: { source: 'User.name', cond: :like },
      start_time: { source: 'Reservation.start_time', cond: :like },
      end_time: { source: 'Reservation.end_time', cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        user: record.user.name,
        start_time: record.start_time,
        end_time: record.end_time
      }
    end
  end

  def get_raw_records
    Reservation.where(room_id: params[:room_id]).eager_load(:user)
  end

end
