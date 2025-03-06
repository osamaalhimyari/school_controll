import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'initial_migrations.dart';
import 'upgrade_migrations.dart';

class DbHelper {
  static Database? _db;
  late String databaseName;
  late int version = 1;
  DbHelper({required this.databaseName, required this.version});
  Future<Database> get db async {
    _db ??= await _initializeDb();
    return _db!;
  }

  Future<Database> _initializeDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, databaseName);
    debugPrint("======= start DB ($databaseName) initialization");

    return openDatabase(
      path,
      version: version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final initialMigration = InitialMigration();
    await initialMigration.run(db);
    debugPrint("=======success to initial DB ($databaseName)");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final upgradeMigration = UpgradeMigration();
    await upgradeMigration.run(db, oldVersion, newVersion);
    debugPrint("=======success to Upgrade DB ($databaseName)");
  }

  Future<void> destroyDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    await deleteDatabase(path);
    debugPrint(
        "=======success to destroyDatabase DB ($databaseName) _db=${_db == null}");
  }

/////

  ///fetch data from DB
  Future<List<Map<String, dynamic>>> fetch(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
    String? orderBy,
    int? limit,
  }) async {
    final dbClient = await db;
    return dbClient.query(table,
        where: where, whereArgs: whereArgs, orderBy: orderBy, limit: limit);
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    final dbClient = await db;
    return dbClient.insert(table, values);
  }

  Future<int> update(
      String table, Map<String, dynamic> values, String? where) async {
    final dbClient = await db;
    return dbClient.update(table, values, where: where);
  }

  Future<int> delete(String table, String? where) async {
    final dbClient = await db;
    return dbClient.delete(table, where: where);
  }

  Future<List<Map<String, dynamic>>> customQuery(String sql,
      [List<dynamic>? args]) async {
    final dbClient = await db;
    return dbClient.rawQuery(sql, args);
  }
}
