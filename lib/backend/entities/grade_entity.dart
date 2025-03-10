import 'dart:convert';
import 'package:school_controll/backend/database/schemas/grade_schema.dart';
import '/app/data/model/grade_model.dart';

class GradeEntity {
  static const tableName = GradeSchema.tableName;

  int? id;
  String? name;
  String? description;
  String? stage;
  bool? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? capacity;

  GradeEntity({
    this.id,
    this.name,
    this.description,
    this.stage,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.capacity,
  });

  // Convert a GradeEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'grade_id': id,
      'grade_name': name,
      'grade_description': description,
      'grade_stage': stage,
      'grade_status': status != null ? (status! ? 1 : 0) : null,
      'grade_updated_at': updatedAt?.toIso8601String(),
      'grade_created_at': createdAt?.toIso8601String(),
      'grade_capacity': capacity,
    };
  }

  // Convert a Map to a GradeEntity instance
  factory GradeEntity.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['grade_id'],
      name: map['grade_name'],
      description: map['grade_description'],
      stage: map['grade_stage'],
      status: map['grade_status'] != null ? (map['grade_status'] == 1) : null,
      updatedAt: map['grade_updated_at'] != null
          ? DateTime.parse(map['grade_updated_at'])
          : null,
      createdAt: map['grade_created_at'] != null
          ? DateTime.parse(map['grade_created_at'])
          : null,
      capacity: map['grade_capacity'],
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static GradeEntity fromString(String data) {
    return GradeEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
