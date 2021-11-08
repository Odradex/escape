json.set! :data do
  json.array! @services do |service|
    json.partial! 'services/service', service: service
    json.url  "
              #{link_to 'Show', service }
              #{link_to 'Edit', edit_service_path(service)}
              #{link_to 'Destroy', service, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end