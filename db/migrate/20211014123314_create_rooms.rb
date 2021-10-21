class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :organization, null: false, foreign_key: true
      t.integer :number
      t.integer :size
      t.integer :capacity
      t.numeric :hourly_payment, precision: 6, scale:2

      t.timestamps
    end
  end
end
