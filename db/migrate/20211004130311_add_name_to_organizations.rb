class AddNameToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :name, :string
  end
end
