class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.numeric :price
      t.belongs_to :category, index: true, foreign_key: { to_table: :service_categories }
      t.timestamps
    end
  end
end
