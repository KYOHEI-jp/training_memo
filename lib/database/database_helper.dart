import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'training_record.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('training.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE training_records ( 
  id $idType, 
  part $textType,
  exercise $textType,
  weight $integerType,
  reps $integerType
  )
''');
  }

  Future<int> addTrainingRecord(TrainingRecord record) async {
    final db = await instance.database;
    return db.insert('training_records', record.toMap());
  }

  Future<List<TrainingRecord>> getTrainingRecords() async {
    final db = await instance.database;
    const orderBy = 'part ASC';
    final result = await db.query('training_records', orderBy: orderBy);

    return result.map((json) => TrainingRecord.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
