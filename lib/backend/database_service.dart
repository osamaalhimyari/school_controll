import 'package:get/get.dart';
import '/backend/database/db_helper.dart';
import '/backend/routes/define_routes.dart';

class DatabaseService extends GetxService {
  late DbHelper db;
  Future<DatabaseService> init(String databaseName) async {
    db = Get.put(DbHelper(databaseName: databaseName, version: 1));
    defineRoutes();
    return this;
  }

  Future<void> destroy() async {
    await db.destroyDatabase();
  }
}
