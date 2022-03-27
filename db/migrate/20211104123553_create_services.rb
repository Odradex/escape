class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.numeric :price
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
