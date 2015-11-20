exports.register = (server, options, next) ->
	# call query here?

	next()

exports.register.attributes =
	pkg: require('./package.json')


query = (sql,log=false,return_value=1,cfg='') ->
	# return_value
	# 1 = rows
	# 2 = fields
	# 3 = [rows,fields]
	mysql = require('mysql')
	util  = require('util')
	if cfg is ''
		cfg =
			host: 'localhost'
			user: 'scott'
			password: 'kaylie'
			database: 'hapi'
	db = mysql.createConnection(cfg)
	db.connect()
	if log is true then console.log "sql=#{sql}"
	r = []
	result = db.query(sql, (err, rows, fields) ->
		if err or rows.length is 0
			if log is true then console.log "error=",err
			db.end()
			r = [[],[]]
			if return_value is not 3 then r = []
			return r
		if log is true then console.log "# rows=#{rows.length}"
		rs = []
		for i,row of rows
			rs[i] = {}
			for j,fr of fields
				key = fr.name
				value = row[key]
				rs[i][key] = value
		if return_value is 1 then r = rs
		if return_value is 2 then r = fields
		if return_value is 3 then r = [rs, fields]
		db.end()
		# console.log "r=",rs
		# @r = r
		return true
	)
	console.log "r=",r
	console.log "result=",result
	return result
