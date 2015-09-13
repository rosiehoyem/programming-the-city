json.array!(@initiatives) do |initiative|
  json.extract! initiative, :id, :name, :organizer, :description, :location
  json.url initiative_url(initiative, format: :json)
end
