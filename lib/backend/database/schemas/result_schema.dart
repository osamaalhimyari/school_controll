class ResultSchema {
  static const String tableName = "results";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        result_id INTEGER PRIMARY KEY AUTOINCREMENT,
        result_branch_id INTEGER,
        result_student_id INTEGER,
        result_grade_id INTEGER,
        result_year_id INTEGER,
        result_data TEXT,
        FOREIGN KEY (result_branch_id) REFERENCES branches(branch_id) ON DELETE SET NULL,
        FOREIGN KEY (result_student_id) REFERENCES students(student_id) ON DELETE SET NULL,
        FOREIGN KEY (result_grade_id) REFERENCES grades(grade_id) ON DELETE SET NULL,
        FOREIGN KEY (result_year_id) REFERENCES years(year_id) ON DELETE SET NULL
      )
    ''';
  }
}
///after decoding from json
///  data ={
/// "semester_id":{
/// "subject_id":{"Mid":00,"fin":00},
/// 
/// },
/// }