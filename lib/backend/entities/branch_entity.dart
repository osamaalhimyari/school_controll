import 'dart:convert';

import 'package:school_controll/backend/database/schemas/branch_schema.dart';

import '/app/data/model/branch_model.dart';

class BranchEntity {
  static const tableName = BranchSchema.tableName;

  int? id;
  String? name;
  String? description;
  String? imageUri;
  String? city;
  String? address;
  String? phoneNumber;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  BranchEntity({
    this.id,
    this.name,
    this.description,
    this.imageUri,
    this.city,
    this.address,
    this.phoneNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // Convert a BranchEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'branch_id': id,
      'branch_name': name,
      'branch_description': description,
      'branch_imageUri': imageUri,
      'branch_city': city,
      'branch_address': address,
      'branch_phone_number': phoneNumber,
      'branch_status': status != null ? (status! ? 1 : 0) : null,
      'branch_created_at': createdAt?.toIso8601String(),
      'branch_updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Convert a Map to a BranchEntity instance
  factory BranchEntity.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['branch_id'] as int?,
      name: map['branch_name'] as String?,
      description: map['branch_description'] as String?,
      imageUri: map['branch_imageUri'] as String?,
      city: map['branch_city'] as String?,
      address: map['branch_address'] as String?,
      phoneNumber: map['branch_phone_number'] as String?,
      status: map['branch_status'] != null
          ? (map['branch_status'] as int) == 1
          : null,
      createdAt: map['branch_created_at'] != null
          ? DateTime.tryParse(map['branch_created_at'])
          : null,
      updatedAt: map['branch_updated_at'] != null
          ? DateTime.tryParse(map['branch_updated_at'])
          : null,
    );
  }

  // Convert a JSON string to a BranchEntity instance
  static BranchEntity fromString(String data) {
    return BranchEntity.fromMap(jsonDecode(data));
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
