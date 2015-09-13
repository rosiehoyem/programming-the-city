json.array!(@media) do |medium|
  json.extract! medium, :id, :name, :type, :url, :description, :person
  json.url medium_url(medium, format: :json)
end
