module.exports = function(request, reply) {
  var context;
  context = {
    pageTitle: 'Home Page'
  };
  return reply.view('home', context);
};
