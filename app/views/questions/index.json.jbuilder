json.array!(@questions) do |question|
  json.extract! question, :title, :survey_id, :kind
  json.url question_url(question, format: :json)
end
