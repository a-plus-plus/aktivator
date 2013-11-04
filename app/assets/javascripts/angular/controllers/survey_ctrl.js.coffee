App.controller 'SurveyCtrl', ['$scope','Survey', ($scope, Survey) ->
	$scope.surveys = Survey.query()
]