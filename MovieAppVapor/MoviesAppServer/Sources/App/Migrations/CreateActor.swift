//
//  File.swift
//  
//
//  Created by Dayton on 25/01/21.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateActor:Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors")
            .id()
            .field("name", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors").delete()
    }
}

