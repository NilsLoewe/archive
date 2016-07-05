json.array!(@facts) do |fact|
  json.extract! fact, :id, :option_id, :title, :content, :link, :source
  json.url fact_url(fact, format: :json)
end
