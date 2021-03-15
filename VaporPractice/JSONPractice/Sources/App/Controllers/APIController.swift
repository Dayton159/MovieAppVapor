//
//  APIController.swift
//  
//
//  Created by Dayton on 12/01/21.
//

import Foundation
import Vapor

struct User: Content {
    let name: String
    let age: Int
    let address: Address?
}

struct Address: Content {
    let street: String
    let state: String
    let zipcode: String
}

struct APIController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        let api = routes.grouped("api")
        api.get("users", use: getUsers)
        api.post("users",use: create)
    }
    
    func create(req: Request) throws -> HTTPStatus {
        
        let user = try req.content.decode(User.self)
        print(user)
        return HTTPStatus.ok
        
    }
    
    func getUsers(req: Request) throws -> [User] {
        
//        let users = [["name":"Alex","age":32],["name":"Mary","age": 56]]
//        let data = try JSONSerialization.data(withJSONObject: users, options: .prettyPrinted)
//        return Response(status: .ok, body: Response.Body(data: data))
        
        
        let address = Address(street: "1200 Richmond Ave", state: "TX", zipcode: "77098")
        let user = User(name: "John Doe", age: 32, address: address)
        
        return [user]
        
    }
    
}

