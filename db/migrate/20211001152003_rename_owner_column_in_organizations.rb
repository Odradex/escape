class RenameOwnerColumnInOrganizations < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :owner_id, :user_id
  end
end
