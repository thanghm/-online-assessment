json.array!(@decimals) do |decimal|
  json.extract! decimal, :id, :number, :ip
  json.url decimal_url(decimal, format: :json)
end
