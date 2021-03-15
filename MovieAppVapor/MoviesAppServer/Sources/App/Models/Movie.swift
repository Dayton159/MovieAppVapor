
import Foundation
import Fluent
import Vapor

final class Movie:Model, Content {
    
    static let schema = "movies" //table name
    
    @ID(key: .id)
    var id:UUID?
    
    @Field(key: "title")
    var title:String
    
    @Field(key: "poster")
    var poster:String
    
    // hasMany relationships - One movie has many reviews
    // we have to pass in for who children would it be. Which property is going to be linked which is going to be Reviews
    // so the binding property we are going to use or the property wrapper property is going to be \.$movie
    // It is basically saying that if you find a review, on there the children will have a property called movie and that's how they're connected together.
    @Children(for: \.$movie)
    var reviews: [Review]
    
    // from =  Key path from the pivot to the parent relation referencing the root model.
    // to =  Key path from the pivot to the parent relation referencing the related model.
    @Siblings(through: MovieActor.self, from: \.$movie, to: \.$actor)
    var actors:[Actor]
    
    init() { }
    
    init(id:UUID? = nil, title:String, poster:String) {
        self.id = id
        self.title = title
        self.poster = poster
    }
}
