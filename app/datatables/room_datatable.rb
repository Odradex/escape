class RoomDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :room_path, :edit_room_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      organization: { source: 'Organization.name', cond: :like },
      number: { source: 'Room.number', cond: :like },
      size: { source: 'Room.size', cond: :like },
      capacity: { source: 'Room.capacity', cond: :like },
      hourly_payment: { source: 'Room.hourly_payment', cond: :like },
      options: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        organization: record.organization.name,
        number: record.number,
        size: record.size,
        capacity: record.capacity,
        hourly_payment: record.hourly_payment,
        options: link_to('Показать', room_path(record))
          .concat(' ')
          .concat(link_to('Изменить', edit_room_path(record)))
      }
    end
  end

  def get_raw_records
    Room.eager_load(:organization)
  end
end
