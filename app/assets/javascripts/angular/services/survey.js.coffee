App.factory 'Survey', [ '$resource' , ($resource) ->
	$resource '/surveys/:id', id: '@id'
]