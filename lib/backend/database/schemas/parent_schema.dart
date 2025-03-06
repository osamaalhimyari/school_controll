class ParentSchema {
  static const String tableName = "parents";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        Parent_id INTEGER PRIMARY KEY AUTOINCREMENT,
        Parent_branch_id INTEGER,
        branch_imageUri TEXT,
        Parent_name TEXT,
        Parent_description TEXT,
        Parent_status BIT,
        Parent_phone_number TEXT,
        Parent_address TEXT,
        Parent_updated_at DATE,
        Parent_created_at DATE,
        FOREIGN KEY (Parent_branch_id) REFERENCES branches(branch_id) ON DELETE SET NULL
      )
    ''';
  }
}
