import Fluent
import Vapor

//This represents the data in our database as an object for our app
//Conforms to Model and Content since we are using Fluent
final class Todo: Model, Content {
    //what table/schema, so this Todo class represents the todos table
    static let schema = "todos"
    
    //id property
    @ID(key: .id) //this tells Fluent this property matches to our tables key .id
    var id: UUID?

    //title property
    @Field(key: "title")
    var title: String

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
