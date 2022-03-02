class OrganizationDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :organization_path, :edit_organization_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      name: { source: 'Organization.name', cond: :like },
      owner: { source: 'Organization.user.name', cond: :like },
      adress: { source: 'Organization.adress', cond: :like },
      opening_time: { source: 'Organization.opening_time', cond: :like },
      closing_time: { source: 'Organization.closing_time', cond: :like },
      options: { source: 'data.options', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        owner: record.user.name,
        adress: record.adress,
        opening_time: record.opening_time.strftime('%H:%M'),
        closing_time: record.closing_time.strftime('%H:%M'),
        options: link_to('Показать', organization_path(record))
          .concat(' ')
          .concat(link_to('Изменить', edit_organization_path(record)))
      }
    end
  end

  def get_raw_records
    options[:organizations].all
  end
end
