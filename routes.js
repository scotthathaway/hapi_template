this.info = [
  {
    method: 'GET',
    path: '/',
    handler: function(request, reply) {
      return reply('<h1>Hello World!</h1>');
    }
  }, {
    method: 'GET',
    path: '/public/{path*}',
    handler: {
      directory: {
        path: __dirname + "/public",
        index: false,
        listing: true
      }
    }
  }
];
