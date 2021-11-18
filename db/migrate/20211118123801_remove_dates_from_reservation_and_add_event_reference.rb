class RemoveDatesFromReservationAndAddEventReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :start_time
    remove_column :reservations, :end_time
    add_reference :reservations, :event, index: true, foreign_key: true
  end
end
