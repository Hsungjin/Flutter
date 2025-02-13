import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "cardDatabase.db";
  static const _databaseVersion = 1;

  // DatabaseHelper를 싱글턴으로 하여 데이터베이스 인스턴스가
  // 한번만 초기화 되도록함
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // getDatabasesPath()로 가져온 데이터베이스 경로와
    // 데이터베이스의 이름을 합쳐서 경로로 설정
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      // 데이터베이스 생성시 실행할 SQL
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE cards (
            _id TEXT NOT NULL UNIQUE,
            card_name TEXT NOT NULL,
            card_number TEXT NOT NULL,
            card_expiration_date TEXT NOT NULL,
            card_cvv TEXT NOT NULL,
            card_color TEXT NOT NULL,
            dateTime TEXT,
            PRIMARY KEY(_id)
          )
        ''');
      },
    );
  }

    // 카드 추가
  Future<int> insertCard(Map<String, dynamic> card) async {
    Database db = await database;
    return await db.insert(
      'cards',
      card,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 모든 카드 조회
  Future<List<Map<String, dynamic>>> getAllCards() async {
    Database db = await database;
    return await db.query('cards', orderBy: 'dateTime DESC');
  }

    // 카드 삭제
  Future<int> deleteCard(String id) async {
    Database db = await database;
    return await db.delete(
      'cards',
      where: '_id = ?',
      whereArgs: [id],
    );
  }
}