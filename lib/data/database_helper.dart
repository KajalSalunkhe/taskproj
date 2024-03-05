import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskproj/model/product_model.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'products';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'products.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY,
          title TEXT,
          description TEXT,
          price REAL,
          discountPercentage INTEGER,
          rating REAL,
          stock INTEGER,
          brand TEXT,
          category TEXT,
          thumbnail TEXT
        )
      ''');
      },
    );
  }

  Future<void> insertProducts(List<Product> products) async {
    final Database db = await database;

    for (var product in products) {
      await db.insert(
        tableName,
        product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Product>> getProducts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (index) {
      return Product.fromJson(maps[index]);
    });
  }
}
