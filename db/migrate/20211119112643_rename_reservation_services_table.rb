class RenameReservationServicesTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :reservation_services, :reservations_services
  end
end
