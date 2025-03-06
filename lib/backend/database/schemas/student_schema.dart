class StudentSchema {
  static const String tableName = "students";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        student_id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_branch_id INTEGER,
        student_parent_id INTEGER,
        student_relation_name TEXT,
        branch_imageUri TEXT,
        student_name TEXT,
        student_description TEXT,
        student_gender BIT,
        student_status BIT,
        student_phone_number TEXT,
        student_birth_date TEXT,
        student_birth_place TEXT,
        student_address TEXT,
        student_created_at DATE,
        student_updated_at DATE,
        FOREIGN KEY (student_branch_id) REFERENCES branches(branch_id) ON DELETE SET NULL,
        FOREIGN KEY (student_parent_id) REFERENCES parents(parent_id) ON DELETE SET NULL
      )
    ''';
  }
}
