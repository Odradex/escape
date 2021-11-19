class ServiceDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :service_path, :edit_room_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      category: { source: "Service.category", cond: :like, searchable: true, orderable: true },
      name: { source: "Service.name", cond: :like, searchable: true, orderable: true },
      price: { source: "Service.price", cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        category: record.category,
        name: record.name,
        price: record.price
      }
    end
  end

  def get_raw_records
    Service.all
  end
end
