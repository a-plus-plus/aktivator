json.array!(@options) do |option|
  json.extract! option, :question_id, :value, :id
  json.url option_url(option, format: :json)
end
