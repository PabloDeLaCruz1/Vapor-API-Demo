import Fluent
import Vapor

//Handles our API endpoints
func routes(_ app: Application) throws {
    
    // /
    app.get { req in
        return "It works!"
    }
    // /hello
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    // /Revature
    app.get("Revature") { req -> String in
        return "Providing Opportunities!"
    }
    
    //Separate logic into controllers
    try app.register(collection: TodoController())
}
