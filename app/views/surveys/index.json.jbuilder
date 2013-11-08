json.array!(@surveys) do |survey|	
	json.title survey.title

	json.questions (survey.questions) do |question|
		json.title question.title
		json.options (question.options) do |option|
			json.value option.value
		end
	end
end
