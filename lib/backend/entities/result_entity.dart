import 'dart:convert';

import '/app/data/model/result_model.dart';

class ResultEntity {
  int? id;
  int branchId;
  int studentId;
  int gradeId;
  int yearId;
  Map<String, Map<String, int>>? data; // Nullable map for storing result data

  ResultEntity({
    this.id,
    required this.branchId,
    required this.studentId,
    required this.gradeId,
    required this.yearId,
    this.data,
  });

  // Convert a ResultEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'result_id': id,
      'result_branch_id': branchId,
      'result_student_id': studentId,
      'result_grades_id': gradeId,
      'result_year_id': yearId,
      'result_data':
          data != null ? jsonEncode(data) : null, // Store as JSON string
    };
  }

  // Convert a Map to a ResultEntity instance
  factory ResultEntity.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      id: map['result_id'] as int?,
      branchId: map['result_branch_id'] as int,
      studentId: map['result_student_id'] as int,
      gradeId: map['result_grades_id'] as int,
      yearId: map['result_year_id'] as int,
      data: map['result_data'] != null
          ? Map<String, Map<String, int>>.from(
              jsonDecode(map['result_data'] as String))
          : null, // Deserialize JSON string to Map if not null
    );
  }

  // Convert a JSON string to a ResultEntity instance
  static ResultEntity fromString(String data) {
    return ResultEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
