
import Foundation
import Fluent
import Vapor
import FluentPostgresDriver

// final means it cannot be extended further. It is the final implementation of the class
final class Review: Model, Content {
    
    static let schema = "reviews"
    
    @ID(key: .id)
    var id:UUID? // PK
    
    @Field(key: "title")
    var title:String
    
    @Field(key: "body")
    var body:String
    
    // belongs to - Review belongs to a movie
    @Parent(key: "movie_id") //FK
    var movie:Movie
    
    // we use empty init because when you're using this model or using other model that are using this model,
    // this can't be used to initialized a copy or an instance of the review class without providing anything.
    init() { }
    
    init(id:UUID? = nil, title:String, body:String, movieId:UUID) {
        self.id = id
        self.title = title
        self.body = body
        
        // we have to use property wrapper and we want to use the underlying value of the property wrapper for the movie
        // so if you want to access the underlying value, you can always put the dollar sign
        self.$movie.id = movieId
        
        // dollar sign simply means that we are trying to get the underlying value of the property wrapper, which is movie
        // and then set the id of the movie to movieId that is what the person is passing.
    }
}
