json.array!(@constraints) do |constraint|
  json.extract! constraint, :id, :title
  json.url constraint_url(constraint, format: :json)
end
