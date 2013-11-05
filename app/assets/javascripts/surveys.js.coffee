App.controller 'SurveyCtrl', ['$scope','Survey','Question', ($scope, Survey, Question) ->
	$scope.$watch 'sid', ->
		if (!$scope.sid)
			$scope.survey = {}
		else
			$scope.survey = Survey.get surveyId:$scope.sid , (obj)->
				$scope.survey = obj
				console.log(obj)
				$scope.questions = Question.query( surveyId:$scope.sid)
			, (err)->
				console.log('ERROR!',err)
				
	

	$scope.post = (survey, event) ->
		#event.preventDefault()
		console.log(survey)
		#Survey.save $scope.survey

	$scope.newQuestion =(event) ->
		console.log('new question!')
		event.preventDefault()
		$scope.questions.push({})

	$scope.removeQuestion = (question, event, index) ->
		console.log('removing question', question)
		event.preventDefault()
		question.destroy = 1

	$scope.newOption = (event, question) ->
		console.log("new option")
		event.preventDefault()
		$scope.question.options.push({})

	$scope.removeOption = (option, event, index) ->
		console.log('removing option', option)
		event.preventDefault()
		option.destroy = 1	

]


App.factory 'Survey', [ '$resource' , ($resource) ->
	$resource '/surveys/:surveyId', surveyId: '@id'
]


App.factory 'Question', [ '$resource' , ($resource) ->
	$resource '/surveys/:surveyId/questions/:questionId', questionId: '@id'
]

App.factory 'Option', [ '$resource', ($resource) ->
	$resource '/surveys/:surveyId/questions/:questionId/options/:optionId', optionId: '@id'
]