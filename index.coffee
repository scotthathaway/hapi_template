Hapi   = require('hapi')
Routes = require("./routes")

server = new Hapi.Server()
server.connection({
    host: 'localhost'
    port: 3000
})

server.register(require('inert'), (err) ->
    if err then throw err

    for i,route of Routes.info
        server.route(route)
)

server.start(() ->
    console.log "Server running at: #{server.info.uri}"
)
