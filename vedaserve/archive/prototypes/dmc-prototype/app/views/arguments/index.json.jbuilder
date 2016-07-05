json.array!(@arguments) do |argument|
  json.extract! argument, :id, :title, :decision_id
  json.url argument_url(argument, format: :json)
end
