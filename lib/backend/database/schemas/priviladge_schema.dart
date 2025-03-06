class PriviladgeSchema {
  static const String tableName = "priviladges";

  /// -- Token field set as PRIMARY KEY
  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        priviladge_token TEXT PRIMARY KEY, 
        priviladge_teacher_id INTEGER,
        priviladge_status BIT,
        priviladge_data TEXT,
        priviladge_updated_at DATE,
        priviladge_created_at DATE,
        FOREIGN KEY (priviladge_teacher_id) REFERENCES teachers(teacher_id) ON DELETE SET NULL
      )
    ''';
  }
}
