class OrganizationDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: 'Organization.name', cond: :like },
      owner: { source: 'Organization.owner', cond: :like },
      adress: { source: 'Organization.adress', cond: :like },
      opening_time: { source: 'Organization.opening_time', cond: :like },
      closing_time: { source: 'Organization.closing_time', cond: :like }
    }
  end

  def data
    records.map do |_record|
      {
        name: record.name,
        owner: record.owner,
        adress: record.adress,
        opening_time: record.opening_time,
        closing_time: record.closing_time
      }
    end
  end

  def get_raw_records
    # User.all
  end
end
