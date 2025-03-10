import 'dart:convert';
import 'package:school_controll/backend/database/schemas/teacher_schema.dart';
import '/app/data/model/teacher_model.dart';

class TeacherEntity {
  static const tableName = TeacherSchema.tableName;

  int? id;
  int? type;
  String? name;
  String? description;
  bool? status;
  bool? gender;
  DateTime? birthDate;
  String? phoneNumber;
  String? birthPlace;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;

  TeacherEntity({
    this.id,
    this.type,
    this.name,
    this.description,
    this.status,
    this.gender,
    this.birthDate,
    this.phoneNumber,
    this.birthPlace,
    this.address,
    this.updatedAt,
    this.createdAt,
  });

  // Convert a TeacherEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'teacher_id': id,
      'teacher_type': type,
      'teacher_name': name,
      'teacher_description': description,
      'teacher_status': status != null ? (status! ? 1 : 0) : null,
      'teacher_gender': gender != null ? (gender! ? 1 : 0) : null,
      'teacher_birth_date': birthDate?.toIso8601String(),
      'teacher_phone_number': phoneNumber,
      'teacher_birth_place': birthPlace,
      'teacher_address': address,
      'teacher_updated_at': updatedAt?.toIso8601String(),
      'teacher_created_at': createdAt?.toIso8601String(),
    };
  }

  // Convert a Map to a TeacherEntity instance
  factory TeacherEntity.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      id: map['teacher_id'],
      type: map['teacher_type'],
      name: map['teacher_name'],
      description: map['teacher_description'],
      status: map['teacher_status'] == 1
          ? true
          : (map['teacher_status'] == 0 ? false : null),
      gender: map['teacher_gender'] == 1
          ? true
          : (map['teacher_gender'] == 0 ? false : null),
      birthDate: map['teacher_birth_date'] != null
          ? DateTime.parse(map['teacher_birth_date'])
          : null,
      phoneNumber: map['teacher_phone_number'],
      birthPlace: map['teacher_birth_place'],
      address: map['teacher_address'],
      updatedAt: map['teacher_updated_at'] != null
          ? DateTime.parse(map['teacher_updated_at'])
          : null,
      createdAt: map['teacher_created_at'] != null
          ? DateTime.parse(map['teacher_created_at'])
          : null,
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static TeacherEntity fromString(String data) {
    return TeacherEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
