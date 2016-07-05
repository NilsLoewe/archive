json.array!(@sources) do |source|
  json.extract! source, :id, :title, :decision_id
  json.url source_url(source, format: :json)
end
