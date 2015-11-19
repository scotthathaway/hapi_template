var Config, Hapi, HapiProxy, Inert, Vision, server;

Hapi = require('hapi');

server = new Hapi.Server();

Config = require("./config");

server.connection(Config.server_config);

Inert = require('inert');

Vision = require('vision');

HapiProxy = require('h2o2');

server.register([Inert, Vision, HapiProxy], function(err) {
  var i, route, _ref;
  if (err) {
    throw err;
  }
  _ref = Config.routes;
  for (i in _ref) {
    route = _ref[i];
    server.route(route);
  }
  return server.views(Config.views_config);
});

server.start(function() {
  return console.log("Server running at: " + server.info.uri);
});
