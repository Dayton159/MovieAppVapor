import Vapor

struct Context:Content {
    let movies:[Movie]
    
}

struct Review:Content {
    let title:String
    let rating:Int
}

struct Movie:Content {
    var name: String
    var reviews: [Review] = [Review]()
}

 
func routes(_ app: Application) throws {
    
    //localhost:8080
    app.get { req -> EventLoopFuture<View> in
//        return req.view.render("index", ["title": "Hello Vapor!"])
        
        var movie = Movie(name: "Spiderman")
        let review = [Review(title: "Good", rating: 4), Review(title: "So-so", rating: 3)]
        movie.reviews = review
        
        let context = Context(movies: [movie])
        
        return req.view.render("index", context)
    }
    
    app.get("about-us") { req -> EventLoopFuture<View> in
        
        req.view.render("about")
    }
    
    app.post("add-movie") { req -> Response in
        
        let movie = try req.content.decode(Movie.self)
        
        // write code to save movie to database
        print(movie)
        
        return req.redirect(to: "/")
    }
    
}
