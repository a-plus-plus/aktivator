App.controller 'SurveyCtrl', ['$scope','Survey', ($scope, Survey) ->
	$scope.surveys = Survey.query()

	$scope.post = (survey, event) ->
		event.preventDefault()
		console.log(survey)
		Survey.save $scope.survey
]