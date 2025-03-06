/// the class room in the school
class GradeSchema {
  static const String tableName = "grades";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
        grade_name TEXT,
        grade_description TEXT,
        grade_stage TEXT,
        grade_status BIT,
        grade_updated_at DATE,
        grade_created_at DATE,
        grade_capacity INTEGER
        )
    ''';
  }
}
