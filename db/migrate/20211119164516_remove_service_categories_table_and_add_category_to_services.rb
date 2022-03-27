class RemoveServiceCategoriesTableAndAddCategoryToServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :category_id
    add_column :services, :category, :integer
  end
end
