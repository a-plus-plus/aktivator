App.controller 'SurveyCtrl', ['$scope','Survey', ($scope, Survey) ->
	$scope.surveys = Survey.query()

	$scope.post = (survey, event) ->
		#event.preventDefault()
		console.log(survey)
		#Survey.save $scope.survey

	$scope.newQuestion =(event) ->
		console.log('new!')
		event.preventDefault()
		$scope.questions.push({})

	$scope.removeQuestion = (question, event, index) ->
		console.log('removing', question)
		event.preventDefault()
		question.destroy = 1

]


App.factory 'Survey', [ '$resource' , ($resource) ->
	$resource '/surveys/'
]