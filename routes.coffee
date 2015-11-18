@info = [
    {
        method: 'GET'
        path: '/'
        handler: (request,reply) ->
            reply('<h1>Hello World!</h1>')
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
