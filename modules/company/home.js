module.exports = function(request, reply) {
  var Promise, db;
  Promise = require("bluebird");
  db = Promise.promisifyAll(require("../../libs/db"));
  return db.query("select * from people").then(function(rs) {
    var context;
    context = {
      pageTitle: 'Home Page',
      rs: rs
    };
    console.log("home rs =", context);
    return reply.view('home', context);
  });
};
