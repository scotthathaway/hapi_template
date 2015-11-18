this.routes = [
  {
    method: 'GET',
    path: '/',
    handler: function(request, reply) {
      return reply.view('index', {
        name: 'Scott'
      });
    }
  }, {
    method: 'GET',
    path: '/users/{name}',
    handler: function(request, reply) {
      var name;
      name = encodeURIComponent(request.params.name);
      return reply.view('index', {
        name: name
      });
    }
  }, {
    method: 'GET',
    path: '/public/{path*}',
    handler: {
      directory: {
        path: "../hapi_template_common",
        index: false,
        listing: true
      }
    }
  }
];

this.server_config = {
  host: 'localhost',
  port: 3000
};

this.views_config = {
  engines: {
    html: require('handlebars')
  },
  relativeTo: __dirname,
  path: 'templates'
};
