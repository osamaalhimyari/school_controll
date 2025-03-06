class SubjectSchema {
  static const String tableName = "subjects";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject_name TEXT,
        subject_status BIT,
        subject_min_point INTEGER,
        subject_max_point INTEGER,
        subject_updated_at DATE,
        subject_created_at DATE
      )
    ''';
  }
}
