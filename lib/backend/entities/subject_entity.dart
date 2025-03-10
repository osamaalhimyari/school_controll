import 'dart:convert';
import 'package:school_controll/backend/database/schemas/subject_schema.dart';
import '/app/data/model/subject_schema.dart';

class SubjectEntity {
  static const tableName = SubjectSchema.tableName;

  int? id;
  String? name;
  bool? status;
  int? minPoint;
  int? maxPoint;
  DateTime? updatedAt;
  DateTime? createdAt;

  SubjectEntity({
    this.id,
    this.name,
    this.status,
    this.minPoint,
    this.maxPoint,
    this.updatedAt,
    this.createdAt,
  });

  // Convert a SubjectEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'subject_id': id,
      'subject_name': name,
      'subject_status': status != null ? (status! ? 1 : 0) : null,
      'subject_min_point': minPoint,
      'subject_max_point': maxPoint,
      'subject_updated_at': updatedAt?.toIso8601String(),
      'subject_created_at': createdAt?.toIso8601String(),
    };
  }

  // Convert a Map to a SubjectEntity instance
  factory SubjectEntity.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['subject_id'],
      name: map['subject_name'],
      status: map['subject_status'] == 1
          ? true
          : (map['subject_status'] == 0 ? false : null),
      minPoint: map['subject_min_point'],
      maxPoint: map['subject_max_point'],
      updatedAt: map['subject_updated_at'] != null
          ? DateTime.parse(map['subject_updated_at'])
          : null,
      createdAt: map['subject_created_at'] != null
          ? DateTime.parse(map['subject_created_at'])
          : null,
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static SubjectEntity fromString(String data) {
    return SubjectEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
