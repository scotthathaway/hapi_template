exports.register = (server, options, next) ->
    server.route(
        method: 'GET'
        path: '/public/{path*}'
        handler:
            directory:
                path: "../hapi_template_common"
                index: false
                listing: true
    )
    next()

exports.register.attributes =
	pkg: require('./package.json')
