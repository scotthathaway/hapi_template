var Hapi, Routes, server;

Hapi = require('hapi');

Routes = require("./routes");

server = new Hapi.Server();

server.connection({
  host: 'localhost',
  port: 3000
});

server.register(require('inert'), function(err) {
  var i, route, _ref, _results;
  if (err) {
    throw err;
  }
  _ref = Routes.info;
  _results = [];
  for (i in _ref) {
    route = _ref[i];
    _results.push(server.route(route));
  }
  return _results;
});

server.start(function() {
  return console.log("Server running at: " + server.info.uri);
});
