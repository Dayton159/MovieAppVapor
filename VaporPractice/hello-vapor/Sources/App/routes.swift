import Vapor

func routes(_ app: Application) throws {
    
    //MARK: - Basic Routes
    
    // http://127.0.0.1:8080
    app.get { req in
        return "It works!"
    }
    
    // http://127.0.0.1:8080/hello
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    
    //MARK: - Nested Routes
    /*
    // http://127.0.0.1:8080/movies/genre/fiction
    app.get("movies", "genre", "fiction") { req -> String in
        return "movies/genre/fiction"
    }
    
    // http://127.0.0.1:8080/movies/genre/comedy
    app.get("movies", "genre", "comedy") { req -> String in
        return "movies/genre/comedy"
    }
    */
    
   //MARK: - Route Parameters
    
    app.get("movies","year", ":year" ,"genre", ":name") { req -> String in
        
        guard let name = req.parameters.get("name"),
              let year = req.parameters.get("year") else { throw Abort(.badRequest)}
        
        return "the genre is \(name) & the year of release is \(year)"
    }
    
    
    app.get("movies", "genre", ":name") { req -> String in
        
        guard let name = req.parameters.get("name") else { throw Abort(.badRequest)}
        
        return "the genre is \(name)"
    }
    
    //MARK: - Anything Routes
    
    app.get("foo", "*", "baz") { req in
        return "foo baz whatever"
    }
    
    //MARK: - CatchAll Routes
    
    app.get("foo", "**") { req in
        return "FOO"
    }
    
    //MARK: - Query String
    
    // /search?keyword=toys&page=12
    app.get("search") { req -> String in
            
        guard let keyword = req.query["keyword"] as String?,
              let page = req.query["page"] as Int? else { throw Abort(.badRequest)}
        
        return "keyword = \(keyword) and page = \(page)"
    }
    
    //MARK: - Route Groups
    
    // /users/12
    // /users/
    // POST /users
    
    let users = app.grouped("users")
    
    // /users
    users.get { req in
        return "/users"
    }
    
    // /users/12
    users.get(":userId") { req -> String in
        
        guard let userId = req.parameters.get("userId") else { throw Abort(.badRequest)}
        
        return "userId = \(userId)"
    }
    
    // POST /users
    users.post { req in
        return "POST"
    }
    
}
