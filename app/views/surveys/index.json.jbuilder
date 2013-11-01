json.array!(@surveys) do |survey|
  json.extract! survey, :title
  json.url survey_url(survey, format: :json)
end
