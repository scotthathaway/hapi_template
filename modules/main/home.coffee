module.exports = (request, reply) ->
	Promise = require("bluebird")
	db = Promise.promisifyAll(require("../../libs/db"))
	db.query("select * from people").then((rs)->
		context =
			pageTitle: 'Home Page'
			rs: rs
		# console.log "home rs =", context
		reply.view('home', context)
	)
