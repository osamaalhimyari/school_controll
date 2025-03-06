// the info of the single branch
class BranchSchema {
  static const String tableName = "branches";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        branch_id INTEGER PRIMARY KEY AUTOINCREMENT,
        branch_name TEXT,
        branch_description TEXT,
        branch_imageUri TEXT,
        branch_city TEXT,
        branch_address TEXT,
        branch_phone_number TEXT,
        branch_status BIT,
        branch_created_at DATE,
        branch_updated_at DATE
        )
    ''';
  }

  String distroy() {
    return 'DROP TABLE IF EXISTS $tableName';
  }

  static String upgrade() {
    return 'ALTER TABLE $tableName ADD COLUMN newColumn TEXT';
  }
}
