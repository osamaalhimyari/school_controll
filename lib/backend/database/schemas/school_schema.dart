// the main info of all branches
class SchoolSchema {
  static const String tableName = "schools";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        school_id INTEGER PRIMARY KEY AUTOINCREMENT,
        school_name TEXT,
        school_description TEXT,
        school_logoUri TEXT,
        school_GOV TEXT,
        school_ministry TEXT,
        school_email TEXT,
        school_status BIT,
        school_created_at DATE,
        school_updated_at DATE
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
