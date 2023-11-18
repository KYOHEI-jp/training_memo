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

    return await openDatabase(
        path,
        version: 2, // バージョンを2に更新
        onCreate: _createDB,
        onUpgrade: _onUpgrade // onUpgrade メソッドを追加
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const dateTimeType = 'DATETIME NOT NULL';

    await db.execute('''
CREATE TABLE training_records ( 
  id $idType, 
  part $textType,
  exercise $textType,
  weight $integerType,
  reps $integerType,
  created_at $dateTimeType  // 日付/タイムスタンプ列の追加
  )
''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE training_records ADD COLUMN created_at DATETIME');
    }
  }



  Future<int> addTrainingRecord(Map<String, dynamic> record) async {
    final db = await instance.database;
    record['created_at'] = DateTime.now().toIso8601String(); // 現在の日時を設定
    return await db.insert('training_records', record);
  }


  Future<List<TrainingRecord>> getTrainingRecords() async {
    final db = await instance.database;
    const orderBy = 'created_at DESC'; // 降順にソート
    final result = await db.query('training_records', orderBy: orderBy);

    return result.map<TrainingRecord>((json) => TrainingRecord.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
