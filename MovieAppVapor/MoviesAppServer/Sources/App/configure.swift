import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: "localhost",
        username: "postgres",
        password: "",
        database: "moviesdb"
    ), as: .psql)

    // configuring the migration code
    app.migrations.add(CreateMovie())
    app.migrations.add(CreateReview())
    app.migrations.add(CreateActor())
    app.migrations.add(CreateMovieActor())
    app.migrations.add(AddPosterColumnToMovies())
    

    // register routes
    try routes(app)
}
