class RemoveServiceCategoriesTableAndAddCategoryToServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :category_id
    drop_table :service_categories
    add_column :services, :category, :integer
  end
end
