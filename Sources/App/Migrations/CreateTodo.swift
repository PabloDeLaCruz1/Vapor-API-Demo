//Fluent is a ORM framework used for migrations
import Fluent

//Migration is used for creating our DB.
//Like Git, for DB we use migrations to track changes to our models/DB
struct CreateTodo: AsyncMigration {
    
    //Here we prepare our changes for migration
    func prepare(on database: Database) async throws {
        //our table is called 'todos'
        try await database.schema("todos")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    //Here we revert any changes
    func revert(on database: Database) async throws {
        try await database.schema("todos").delete()
    }
}
