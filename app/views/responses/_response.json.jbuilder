
json.questions (@questions) do |question|
	json.title question.title
	json.options (question.options) do |option|
		json.value option.value
		end
	end






