class ChangeEndTimeTypeReservation < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :end_time, "timestamp USING current_date + end_time::time"
  end
end
