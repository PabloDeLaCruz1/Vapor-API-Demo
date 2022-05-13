import App
import Vapor

//Application Entry Point
var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }

//Connect to DB, create Todo Table, run route function, register TodoController
//Require a running db, `docker-compose up db`
try configure(app)
try app.run()
