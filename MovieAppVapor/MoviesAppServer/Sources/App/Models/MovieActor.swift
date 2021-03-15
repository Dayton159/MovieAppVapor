//
//  File.swift
//  
//
//  Created by Dayton on 25/01/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

// the reason why we dont conform to Content protocol is that we wont be returning MovieActor JSON
//it is just  a pivot for joining movie and actor tables
final class MovieActor: Model {
    
    static let schema = "movie_actors"
    
    @ID(key: .id)
    var id:UUID?
    
    @Parent(key: "movie_id")
    var movie:Movie
    
    
    @Parent(key: "actor_id")
    var actor:Actor
    
    init() { }
    
    init(movieId:UUID, actorId:UUID) {
        self.$movie.id = movieId
        self.$actor.id = actorId
    }
}
