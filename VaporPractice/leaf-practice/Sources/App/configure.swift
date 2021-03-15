import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // middleware is simply the code or files or packages which will be executed between request and response
    // Everything we put inside the public directory(Javascript, image, CSS file) we can access it as an url
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    
    app.views.use(.leaf)

    

    // register routes
    try routes(app)
}
