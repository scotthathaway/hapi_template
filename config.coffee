@routes = [
    {
        method: 'GET'
        path: '/db/{name?}'
        handler: (request,reply) ->
            _ = require('lodash')
            mysql = require('mysql')
            cfg =
                host: 'localhost'
                user: 'scott'
                password: 'kaylie'
                database: 'hapi'
            db = mysql.createConnection(cfg)
            db.connect()
            wc = ''
            if ! _.isUndefined(request.params.name)
                name = request.params.name
                wc = "where name='#{name}'"
            sql = "select id,name from people #{wc} limit 1"
            console.log "sql=#{sql}"
            db.query(sql, (err, rows, fields) ->
                if err then console.log "error:",err
                # console.log "The name is " + rows[0].name
                name = "World"
                console.log "rows=",rows.length
                if rows.length>0 then name = rows[0].name
                reply.view('index',{name:name})
            )
    }
    {
        method: 'GET'
        path: '/'
        handler: (request,reply) ->
            reply.view('index',{name: 'World!'})
    }
    {
        method: 'GET'
        path: '/public/{path*}'
        handler:
            directory:
                path: "../hapi_template_common"
                index: false
                listing: true
    }
]

@server_config = {
    host: 'localhost'
    port: 3000
}

@views_config = {
    engines:
        html: require('handlebars')
    relativeTo: __dirname
    path: 'templates'
}
