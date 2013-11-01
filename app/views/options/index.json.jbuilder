json.array!(@options) do |option|
  json.extract! option, :question_id, :value
  json.url option_url(option, format: :json)
end
