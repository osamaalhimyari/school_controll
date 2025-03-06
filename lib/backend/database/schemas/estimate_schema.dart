class EstimateSchema {
  static const String tableName = "estimates";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        estimate_id INTEGER PRIMARY KEY AUTOINCREMENT,
        estimate_name TEXT,
        estimate_from_value INTEGER,
        estimate_to_value INTEGER
      )
    ''';
  }

  static String destroy() {
    return 'DROP TABLE IF EXISTS $tableName';
  }

  static String upgrade() {
    return 'ALTER TABLE $tableName ADD COLUMN newColumn TEXT';
  }
}
