this.routes = [
  {
    method: 'GET',
    path: '/db/{name?}',
    handler: function(request, reply) {
      var cfg, db, mysql, name, sql, wc, _;
      _ = require('lodash');
      mysql = require('mysql');
      cfg = {
        host: 'localhost',
        user: 'scott',
        password: 'kaylie',
        database: 'hapi'
      };
      db = mysql.createConnection(cfg);
      db.connect();
      wc = '';
      if (!_.isUndefined(request.params.name)) {
        name = request.params.name;
        wc = "where name='" + name + "'";
      }
      sql = "select id,name from people " + wc + " limit 1";
      console.log("sql=" + sql);
      return db.query(sql, function(err, rows, fields) {
        if (err) {
          console.log("error:", err);
        }
        name = "World";
        console.log("rows=", rows.length);
        if (rows.length > 0) {
          name = rows[0].name;
        }
        return reply.view('index', {
          name: name
        });
      });
    }
  }, {
    method: 'GET',
    path: '/',
    handler: function(request, reply) {
      return reply.view('index', {
        name: 'World!'
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
