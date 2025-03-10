import 'dart:convert';

import '../database/schemas/semester_schema.dart';
import '/app/data/model/semester_model.dart';

class SemesterEntity {
  static const tableName = SemesterSchema.tableName;

  int? id;
  String? name;
  int? index;
  bool? status;
  DateTime? updatedAt;
  DateTime? createdAt;

  SemesterEntity({
    this.id,
    this.name,
    this.index,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

  // Convert a SemesterEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'semester_id': id,
      'semester_name': name,
      'semester_index': index,
      'semester_status': status == true ? 1 : 0,
      'semester_updated_at': (updatedAt ?? DateTime.now()).toIso8601String(),
      'semester_created_at': (createdAt ?? DateTime.now()).toIso8601String(),
    };
  }

  // Convert a Map to a SemesterEntity instance
  factory SemesterEntity.fromMap(Map<String, dynamic> map) {
    return SemesterModel(
      id: map['semester_id'] as int?,
      name: map['semester_name'] as String?,
      index: map['semester_index'],
      status: map['semester_status'] == 1 ? true : null,
      updatedAt: map['semester_updated_at'] != null
          ? DateTime.parse(map['semester_updated_at'])
          : null,
      createdAt: map['semester_created_at'] != null
          ? DateTime.parse(map['semester_created_at'])
          : null,
    );
  }

  // Convert a JSON string to a SemesterEntity instance
  static SemesterEntity fromString(String data) {
    return SemesterEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
