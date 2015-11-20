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
