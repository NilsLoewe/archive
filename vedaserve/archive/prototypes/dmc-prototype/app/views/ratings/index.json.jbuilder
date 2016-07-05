json.array!(@ratings) do |rating|
  json.extract! rating, :id, :side, :option_id, :argument_id, :value
  json.url rating_url(rating, format: :json)
end
