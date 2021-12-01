class AddReservationIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :reservation, index: true, foreign_key: true
  end
end
