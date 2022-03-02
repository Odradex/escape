class ReservationDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :reservation_path, :edit_reservation_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      user: { source: 'User.name', cond: :like },
      start_time: { source: 'Reservation.start_time', cond: :like },
      end_time: { source: 'Reservation.end_time', cond: :like },
      options: { source: 'data.options', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        user: record.user.name,
        start_time: record.start_time.strftime('%H:%M'),
        end_time: record.end_time.strftime('%H:%M'),
        options: link_to('Изменить', edit_reservation_path(record))
      }
    end
  end

  def get_raw_records
    Reservation.where(room_id: params[:room_id]).eager_load(:user)
  end
end
