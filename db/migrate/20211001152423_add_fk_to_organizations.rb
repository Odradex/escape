class AddFkToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :organizations, :users
  end
end
