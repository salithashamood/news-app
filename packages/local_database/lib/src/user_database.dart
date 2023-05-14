import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:utilities/utilities.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();

    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE user_login (
      id $idType,
      name $textType,
      email $textType,
      password $textType
    )
''');
  }

  Future<User> saveUser(User user) async {
    final db = await instance.database;
    final id = await db.insert('user_login', user.toJson());
    return await getUserWithId(id);
  }

  Future<User> getUserWithId(int id) async {
    final db = await instance.database;
    final user = await db.query('user_login',
        columns: ['id', 'name', 'email', 'password'],
        where: 'id = ?',
        whereArgs: [id]);
    if (user.isNotEmpty) {
      return User.fromJson(user.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<User> getUserWithEmail(String email) async {
    final db = await instance.database;
    final user = await db.query('user_login',
        columns: ['id', 'name', 'email', 'password'],
        where: 'email = ?',
        whereArgs: [email]);
    if (user.isNotEmpty) {
      return User.fromJson(user.first);
    } else {
      throw Exception('Email $email not found');
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
