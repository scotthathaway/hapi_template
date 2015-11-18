@routes = [
    {
        method: 'GET'
        path: '/'
        handler: (request,reply) ->
            reply.view('index',{name:'Scott'})
    }
    {
        method: 'GET'
        path: '/users/{name}'
        handler: (request,reply) ->
            name = encodeURIComponent(request.params.name)
            reply.view('index',{name: name})
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
