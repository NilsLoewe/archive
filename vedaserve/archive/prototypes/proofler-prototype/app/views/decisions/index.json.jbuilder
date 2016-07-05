json.array!(@decisions) do |decision|
  json.extract! decision, :id, :title, :user_id
  json.url decision_url(decision, format: :json)
end
