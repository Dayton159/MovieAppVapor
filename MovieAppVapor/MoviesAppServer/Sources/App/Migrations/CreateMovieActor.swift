//
//  File.swift
//  
//
//  Created by Dayton on 25/01/21.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovieActor:Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movie_actors")
            .id()
            .field("movie_id", .uuid, .required, .references("movies", "id"))
            .field("actor_id", .uuid, .required, .references("actors", "id"))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movie_actors").delete()
    }
}
