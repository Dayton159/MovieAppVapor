import Vapor

func routes(_ app: Application) throws {

    //it will register all of the routes in the group to this router
    try app.register(collection: UserController())
    
}
