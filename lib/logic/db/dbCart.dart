import 'package:animore/logic/model/modelCart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbCart{
  get tableCart => "cart";

  Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'cart_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS $tableCart(id STRING PRIMARY KEY, name STRING, price STRING)',
        );
      },
      // Version provides path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertCart(ModelCart cart) async {
    // Get a reference to the database.
    final Database database = await db();

    // Insert the Product into the correct table.
    // Specify `conflictAlgorithm`.
    // In this case, if the same product is inserted
    // multiple times, it replaces the previous data.
    await database.insert(
      tableCart,
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCart(int id) async {
    // Get a reference to the database.
    final database = await db();

    // Remove the Product from the database.
    await database.delete(
      tableCart,
      // Use a `where` clause to delete a specific product.
      where: "id = ?",
      // Pass the Products's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<List<ModelCart>> getTodos() async {
    // Get a reference to the database.
    final Database database = await db();
    
    if(!(await databaseExists(database.path))){
      return List<ModelCart>();
    }
    // Query the table for all The Products.
    final List<Map<String, dynamic>> maps = await database.query(tableCart);
    // Convert the List<Map<String, dynamic> into a List<Product>.
    if(maps==null||maps.isEmpty){
      return List<ModelCart>();
    }
    List<ModelCart> list = maps.map((e) => ModelCart.fromMap(e)).toList();
    return list;
  }
}