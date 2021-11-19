class CreateReservationServicesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_services do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.timestamps
    end
  end
end
