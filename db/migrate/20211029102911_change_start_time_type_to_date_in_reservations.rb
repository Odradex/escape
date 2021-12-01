class ChangeStartTimeTypeToDateInReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :start_time, "timestamp USING current_date + start_time::time"
    remove_column :reservations, :date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
