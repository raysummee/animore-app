import 'package:animore/logic/model/modelTodos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbTodos{
  get tableTodos => "Todos";

  Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'table_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS $tableTodos(id INTEGER PRIMARY KEY, todoName STRING, desc STRING, imageLeading STRING, checked INTEGER, removable INTEGER)',
        );
      },
      // Version provides path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertTodos(ModelTodos todos) async {
    // Get a reference to the database.
    final Database database = await db();

    // Insert the Product into the correct table.
    // Specify `conflictAlgorithm`.
    // In this case, if the same product is inserted
    // multiple times, it replaces the previous data.
    await database.insert(
      tableTodos,
      todos.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTodos(int id) async {
    // Get a reference to the database.
    final database = await db();

    // Remove the Product from the database.
    await database.delete(
      tableTodos,
      // Use a `where` clause to delete a specific product.
      where: "id = ?",
      // Pass the Products's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<List<ModelTodos>> getTodos() async {
    // Get a reference to the database.
    final Database database = await db();

    // Query the table for all The Products.
    final List<Map<String, dynamic>> maps = await database.query(tableTodos);
    // Convert the List<Map<String, dynamic> into a List<Product>.
    if(maps.isEmpty){
      return List<ModelTodos>();
    }
    List<ModelTodos> list = maps.map((e) => ModelTodos.fromMap(e)).toList();
    return list;
  }

}