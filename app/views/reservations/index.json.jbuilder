json.set! :data do
  json.array! @reservations do |reservation|
    json.partial! 'reservations/reservation', reservation: reservation
    json.url  "
              #{link_to 'Show', reservation }
              #{link_to 'Edit', edit_reservation_path(reservation)}
              #{link_to 'Destroy', reservation, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end