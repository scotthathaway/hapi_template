Hapi   = require('hapi')
server = new Hapi.Server()

# configuration
Config = require("./config")
Routes = require("./routes")

# server setup
server.connection(Config.server_config)

# plugins
Inert        = require('inert')
Vision       = require('vision')
HapiProxy    = require('h2o2')

# register plugins and create routes
server.register([Inert,Vision,HapiProxy], (err) ->
    if err then throw err

    for i,route of Routes.routes
        server.route(route)

    server.views(Config.views_config)
)

server.start(() ->
    console.log "Server running at: #{server.info.uri}"
)
