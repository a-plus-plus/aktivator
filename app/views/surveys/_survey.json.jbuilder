json.title survey.title
json.status survey.status
json.questions (survey.questions) do |question|
	json.title question.title
	json.id question.id
	json.options (question.options) do |option|
		json.value option.value
		json.id option.id
	end
end
