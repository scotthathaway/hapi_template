Hapi   = require('hapi')
server = new Hapi.Server()

# configuration
Config = require("./config")

# server setup
server.connection(Config.server_config)

# plugins
Inert     = require('inert')
Vision    = require('vision')
HapiProxy = require('h2o2')
Path      = require('path')

# register plugins and create routes
server.register([Inert,Vision,HapiProxy], (err) ->
    if err then throw err

    for i,route of Config.routes
        server.route(route)

    server.views(Config.views_config)
)

server.start(() ->
    console.log "Server running at: #{server.info.uri}"
)
