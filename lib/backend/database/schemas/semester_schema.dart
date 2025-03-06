/// the single term of the teaching year in school
class SemesterSchema {
  static const String tableName = "semesters";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        semester_id INTEGER PRIMARY KEY AUTOINCREMENT,
        semester_name TEXT,
        semester_index BIT,
        semester_status BIT,
        semester_updated_at DATE,
        semester_created_at DATE
      )
    ''';
  }
}
