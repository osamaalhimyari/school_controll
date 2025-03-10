import 'dart:convert';
import 'package:school_controll/backend/database/schemas/parent_schema.dart';

import '/app/data/model/parent_model.dart';

class ParentEntity {
  static const tableName = ParentSchema.tableName;

  int? id;
  int? branchId;
  String? imageUri;
  String? name;
  String? description;
  bool? status;
  String? phoneNumber;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;

  ParentEntity({
    this.id,
    this.branchId,
    this.imageUri,
    this.name,
    this.description,
    this.status,
    this.phoneNumber,
    this.address,
    this.updatedAt,
    this.createdAt,
  });

  // Convert a ParentEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'parent_id': id,
      'parent_branch_id': branchId,
      'parent_imageUri': imageUri,
      'parent_name': name,
      'parent_description': description,
      'parent_status': status != null ? (status! ? 1 : 0) : null,
      'parent_phone_number': phoneNumber,
      'parent_address': address,
      'parent_updated_at': updatedAt?.toIso8601String(),
      'parent_created_at': createdAt?.toIso8601String(),
    };
  }

  // Convert a Map to a ParentEntity instance
  factory ParentEntity.fromMap(Map<String, dynamic> map) {
    return ParentEntity(
      id: map['parent_id'] as int?,
      branchId: map['parent_branch_id'] as int?,
      imageUri: map['parent_imageUri'] as String?,
      name: map['parent_name'] as String?,
      description: map['parent_description'] as String?,
      status: map['parent_status'] != null ? (map['parent_status'] == 1) : null,
      phoneNumber: map['parent_phone_number'] as String?,
      address: map['parent_address'] as String?,
      updatedAt: map['parent_updated_at'] != null
          ? DateTime.parse(map['parent_updated_at'])
          : null,
      createdAt: map['parent_created_at'] != null
          ? DateTime.parse(map['parent_created_at'])
          : null,
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static ParentEntity fromString(String data) {
    return ParentModel.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
