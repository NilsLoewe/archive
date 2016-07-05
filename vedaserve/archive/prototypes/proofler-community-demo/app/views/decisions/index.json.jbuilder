json.array!(@decisions) do |decision|
  json.extract! decision, :id, :description
  json.url decision_url(decision, format: :json)
end
