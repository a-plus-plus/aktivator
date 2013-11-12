json.title tag.title
json.surveys (tag.surveys) do |survey|
	json.survey_id survey.id
	json.survey_title survey.title
end