json.questions (@questions) do |question|
	json.title question.title
    json.kind question.kind
    json.answer_count question.answers.count
	json.options (question.options) do |option|
		json.value option.value
		json.count option.answers.count
	end	
    json.answers (question.answers) do |answer|
        json.value answer.value
    end 
end






