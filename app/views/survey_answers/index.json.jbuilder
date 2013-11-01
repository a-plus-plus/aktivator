json.array!(@survey_answers) do |survey_answer|
  json.extract! survey_answer, :survey_id
  json.url survey_answer_url(survey_answer, format: :json)
end
