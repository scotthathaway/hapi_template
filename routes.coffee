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
                path: __dirname + "/public"
                index: false
                listing: true
    }
]
