json.set! :data do
  json.array! @reservations do |reservation|
    json.partial! 'reservations/reservation', reservation: reservation
    json.url  "
              #{link_to 'Открыть', reservation }
              #{link_to 'Изменить', edit_reservation_path(reservation)}
              #{link_to 'Удалить', reservation, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end