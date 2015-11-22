module.exports = (request, reply) ->
	context =
		pageTitle: 'About Page'

	reply.view('about', context)
