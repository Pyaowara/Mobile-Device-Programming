import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../models/todo.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tododd.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    print("MFFFFFFFFFFFFFFFFFFFF");
    print(dbPath);
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        isCompleted INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // Create - Insert a new todo
  Future<Todo> insertTodo(Todo todo) async {
    final db = await database;
    final id = await db.insert('todos', todo.toMap());
    return todo.copyWith(id: id);
  }

  // Read - Get all todos
  Future<List<Todo>> getTodos() async {
    final db = await database;
    final result = await db.query('todos', orderBy: 'id DESC');
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  // Read - Get a single todo by id
  Future<Todo?> getTodoById(int id) async {
    final db = await database;
    final result = await db.query('todos', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Todo.fromMap(result.first);
    }
    return null;
  }

  // Update - Update an existing todo
  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // Delete - Delete a todo
  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
