App.controller 'SurveyCtrl', ['$scope','Survey','Question','Option', ($scope, Survey, Question, Option) ->
	$scope.$watch 'sid', ->
		console.log 'got sid', $scope.sid
		if (!$scope.sid)
			$scope.survey = {}
			$scope.questions = []
		else
			$scope.survey = Survey.get surveyId:$scope.sid , (obj)->
				$scope.survey = obj
				console.log(obj)
				$scope.questions = Question.query( surveyId:$scope.sid, (questions)->
					questions.forEach((question)->
						console.log question
						question.options = Option.query({surveyId:$scope.sid, questionId:question.id}, (obj)->
							console.log obj
						, (err)->
							console.log 'ERR', err
						)
					)
				)

			, (err)->
				console.log('ERROR!',err)
				
	

	$scope.post = (survey, event) ->
		#event.preventDefault()
		console.log(survey)
		#Survey.save $scope.survey

	$scope.newQuestion =(event) ->
		console.log('new question!')
		event.preventDefault()
		$scope.questions.push({kind:'Radiobutton', options:[]})

	$scope.removeQuestion = (question, event, index) ->
		console.log('removing question', question)
		event.preventDefault()
		question.destroy = 1

	$scope.newOption = (event, question) ->
		console.log("new option for", question)
		event.preventDefault()
		question.options.push({})

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
	$resource '/surveys/:surveyId/questions/:questionId/options/:optionId', optionId: '@id', surveyId:'@id', questionId:'@id'
]