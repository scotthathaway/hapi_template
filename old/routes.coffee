@routes = [
    {
        method: 'GET'
        path: '/db/{name?}'
        handler: (request,reply) ->
            _ = require('lodash')
            db = require("./db")
            wc = ''
            if ! _.isUndefined(request.params.name)
                name = request.params.name
                wc = "where name='#{name}'"
            sql = "select id,name from people #{wc}"
            rs  = db.query(sql)
            name = "World"
            # console.log "rs = ",rs
            if rs.length>0 then name = rs[0].name
            reply.view('index',{name:name})
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
