class YearSchema {
  static const String tableName = "years";

  static String create() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        year_id INTEGER PRIMARY KEY AUTOINCREMENT,
        year_name TEXT,
        year_status BIT,
        year_config_data TEXT,
        year_updated_at DATE,
        year_created_at DATE
      )
    ''';
  }
}

///after decoding
/// year_config_data=
/// 
///    { "branch_id":{
///             
///           "subjects_for_single_class":{
///                               "class_id":[ ids of subjects selected],
///                                 ... the same for other classes
/// ///                             },
/// 
///           "students_for_single_class":{
///                               "class_id":[ ids of students selected],
///                                 ... the same for other classes
/// ///                             },

///           "subjects_and_classes_for_single_teacher":{
///                               "teacher_id":[
///                                 {"subject_id":[ids for classes] },
///                                  ... the same for other subjects   
///                                      ],
///                                 ... the same for other teachers
/// ///                             },

///           "semesters":[ ids of subjects selected],
///                                  
///                               
/// ///                             
///
///
///                            }
/// ///////// the end            }
/// 