	json.title @survey.title

	json.questions (@survey.questions) do |question|
		json.title question.title
		json.options (question.options) do |option|
			json.value option.value
			json.id option.id
			json.question_id option.question_id
		end
	end
