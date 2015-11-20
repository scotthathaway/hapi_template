module.exports = (request, reply) ->
	context =
		pageTitle: 'Home Page'

	reply.view('home', context)
