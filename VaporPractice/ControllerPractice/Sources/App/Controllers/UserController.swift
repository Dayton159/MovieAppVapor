//
//  UserController.swift
//  ControllerPractice
//
//  Created by Dayton on 11/01/21.
//

import Foundation
import Vapor

//Route Collection = group collections of routes together for adding to a router
struct UserController: RouteCollection {
    
    // inside this controller, we're using Route Collection because we will implement all of our routes
    
    func boot(routes: RoutesBuilder) throws {
        
        // /users
        let users = routes.grouped("users")
        
        // if you go to the root route, that particular request will be handled by something called index
        users.get(use: index)
        
        users.post(use: create)
        
        // users/23
        //we're grouping all the routes that goes to userId
        users.group(":userId") { user in
            // going to /users/23 url will execure show function
            user.get(use: show)
        }
    }
    
    func index(req: Request) throws -> String {
        return "INDEX"
    }
    
    func create(req: Request) throws -> String {
        return "CREATE"
    }
    
    func show(req:Request) throws -> String {
        
        guard let userId = req.parameters.get("userId") as String? else {throw Abort(.badRequest)}
        
        return "userId = \(userId)"
    }
    
}
