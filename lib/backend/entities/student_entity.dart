import 'dart:convert';

import '/app/data/model/student_model.dart';

class StudentEntity {
  int? id;
  int branchId;
  int parentId;
  String relationName;
  String branchImageUri;
  String name;
  String description;
  bool gender;
  bool status;
  String phoneNumber;
  DateTime birthDate;
  String? birthPlace; // Nullable field
  String address;
  DateTime createdAt;
  DateTime updatedAt;

  StudentEntity({
    this.id,
    required this.branchId,
    required this.parentId,
    required this.relationName,
    required this.branchImageUri,
    required this.name,
    required this.description,
    required this.gender,
    required this.status,
    required this.phoneNumber,
    required this.birthDate,
    this.birthPlace, // Nullable field
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert a StudentEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'student_id': id,
      'student_branch_id': branchId,
      'student_parent_id': parentId,
      'student_relation_name': relationName,
      'branch_imageUri': branchImageUri,
      'student_name': name,
      'student_description': description,
      'student_gender': gender ? 1 : 0,
      'student_status': status ? 1 : 0,
      'student_phone_number': phoneNumber,
      'student_birth_date': birthDate.toIso8601String(),
      'student_birth_place': birthPlace, // Nullable field, may be null
      'student_address': address,
      'student_created_at': createdAt.toIso8601String(),
      'student_updated_at': updatedAt.toIso8601String(),
    };
  }

  // Convert a Map to a StudentEntity instance
  factory StudentEntity.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['student_id'],
      branchId: map['student_branch_id'],
      parentId: map['student_parent_id'],
      relationName: map['student_relation_name'],
      branchImageUri: map['branch_imageUri'],
      name: map['student_name'],
      description: map['student_description'],
      gender: map['student_gender'] == 1,
      status: map['student_status'] == 1,
      phoneNumber: map['student_phone_number'],
      birthDate: DateTime.parse(map['student_birth_date']),
      birthPlace: map['student_birth_place'], // Nullable field
      address: map['student_address'],
      createdAt: DateTime.parse(map['student_created_at']),
      updatedAt: DateTime.parse(map['student_updated_at']),
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static StudentEntity fromString(String data) {
    return StudentEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
