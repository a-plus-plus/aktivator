json.array!(@answers) do |answer|
  json.extract! answer, :option_id, :value, :surveyAnswer_id
  json.url answer_url(answer, format: :json)
end
