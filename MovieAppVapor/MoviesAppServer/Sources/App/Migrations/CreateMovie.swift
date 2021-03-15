import Fluent
import FluentPostgresDriver

struct CreateMovie: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("movies") // tablename
            .id()
            .field("title", .string) // column name
            .create()
    }

    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("movies").delete()
    }
}
