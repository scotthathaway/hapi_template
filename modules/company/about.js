module.exports = function(request, reply) {
  var context;
  context = {
    pageTitle: 'About Page'
  };
  return reply.view('about', context);
};
