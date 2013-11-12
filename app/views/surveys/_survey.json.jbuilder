json.title survey.title
json.status survey.status
json.id survey.id
json.questions (survey.questions) do |question|
	json.title question.title
	json.id question.id
	json.options (question.options) do |option|
		json.value option.value
		json.id option.id
		json.question_id option.question.id
	end
end
