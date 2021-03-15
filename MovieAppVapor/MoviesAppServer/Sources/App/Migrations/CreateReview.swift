//
//  File.swift
//  
//
//  Created by Dayton on 18/01/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreateReview:Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("reviews")
            .id()
            .field("title", .string)
            .field("body", .string)
            .field("movie_id", .uuid, .references("movies", "id"))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("reviews").delete()
    }
}
