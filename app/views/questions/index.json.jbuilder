json.array!(@questions) do |question|
  json.extract! question, :title, :survey_id, :kind, :id
  json.url question_url(question, format: :json)
end
