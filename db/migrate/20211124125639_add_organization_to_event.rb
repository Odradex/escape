class AddOrganizationToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :organization_id, :integer
  end
end
