import 'package:sqflite/sqflite.dart';

class UpgradeMigration {
  Future<void> run(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // await db.execute(EstimateSchema.upgrade());
    }
  }
}
