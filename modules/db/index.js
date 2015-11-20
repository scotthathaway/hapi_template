var query;

exports.register = function(server, options, next) {
  return next();
};

exports.register.attributes = {
  pkg: require('./package.json')
};

query = function(sql, log, return_value, cfg) {
  var db, mysql, r, result, util;
  if (log == null) {
    log = false;
  }
  if (return_value == null) {
    return_value = 1;
  }
  if (cfg == null) {
    cfg = '';
  }
  mysql = require('mysql');
  util = require('util');
  if (cfg === '') {
    cfg = {
      host: 'localhost',
      user: 'scott',
      password: 'kaylie',
      database: 'hapi'
    };
  }
  db = mysql.createConnection(cfg);
  db.connect();
  if (log === true) {
    console.log("sql=" + sql);
  }
  r = [];
  result = db.query(sql, function(err, rows, fields) {
    var fr, i, j, key, row, rs, value;
    if (err || rows.length === 0) {
      if (log === true) {
        console.log("error=", err);
      }
      db.end();
      r = [[], []];
      if (return_value === !3) {
        r = [];
      }
      return r;
    }
    if (log === true) {
      console.log("# rows=" + rows.length);
    }
    rs = [];
    for (i in rows) {
      row = rows[i];
      rs[i] = {};
      for (j in fields) {
        fr = fields[j];
        key = fr.name;
        value = row[key];
        rs[i][key] = value;
      }
    }
    if (return_value === 1) {
      r = rs;
    }
    if (return_value === 2) {
      r = fields;
    }
    if (return_value === 3) {
      r = [rs, fields];
    }
    db.end();
    return true;
  });
  console.log("r=", r);
  console.log("result=", result);
  return result;
};
