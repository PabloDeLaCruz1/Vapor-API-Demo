import Fluent
import Vapor

//Our controller is like a collection of routes/functionalities
struct TodoController: RouteCollection {
    
    //boot is like an init()
    func boot(routes: RoutesBuilder) throws {
        //When we go to the route /todos
        let todos = routes.grouped("todos")
        //Query data using index function
        todos.get(use: index)
        //creating data
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.delete(use: delete)
        }
    }
    // /todos route
    func index(req: Request) async throws -> [Todo] {
        //Fluent gets all data doing a request, returns array of Todo items
        try await Todo.query(on: req.db).all()
    }

    // async await works like promises
    // our create takes in a Request
    func create(req: Request) async throws -> Todo {
        //we decode our content into a type of Todo.self. This like is json deconding
        let todo = try req.content.decode(Todo.self)
        //save our todo variable using Fluent .save
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .ok
    }
}
