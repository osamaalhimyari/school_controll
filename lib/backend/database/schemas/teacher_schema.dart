class TeacherSchema {
  static const String tableName = "teachers";
//        teacher_branch_id INTEGER,
//  FOREIGN KEY (teacher_branch_id) REFERENCES branches(branch_id) ON DELETE SET NULL

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
        teacher_type INTEGER,
        branch_imageUri TEXT,
        teacher_name TEXT,
        teacher_description TEXT,
        teacher_status BIT,
        teacher_gender BIT,
        teacher_birth_date TEXT,
        teacher_phone_number TEXT,
        teacher_birth_place TEXT,
        teacher_address TEXT,
        teacher_updated_at DATE,
        teacher_created_at DATE
            )
    ''';
  }
}
