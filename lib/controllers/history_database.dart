import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class HistoryDatabase {
  static final HistoryDatabase instance = HistoryDatabase._init();
  static Database? _database;

  HistoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('history.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE history (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          calculation TEXT NOT NULL,
          timestamp TEXT NOT NULL
        )
      ''');
      print('History table created successfully!');
    } catch (e) {
      print('Error creating history table: $e');
    }
  }

  Future<void> addHistory(String calculation, String timestamp) async {
    final db = await instance.database;
    await db.insert(
      'history',
      {'calculation': calculation, 'timestamp': timestamp},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Calculation added: $calculation at $timestamp');
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final db = await instance.database;
    final data = await db.query('history', orderBy: 'id DESC');
    print('History fetched: $data');
    return data;
  }

  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'history.db');
    await deleteDatabase(path);
    print('Database deleted!');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
    print('Database closed.');
  }
}
