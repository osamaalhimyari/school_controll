import 'dart:convert';

import '../../app/data/model/school_model.dart';

class SchoolEntity {
  int? id;
  String? name;
  String? description;
  String? logoUri;
  String? gov;
  String? ministry;
  String? email;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SchoolEntity({
    this.id,
    this.name,
    this.description,
    this.logoUri,
    this.gov,
    this.ministry,
    this.email,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // Convert a SchoolEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'school_id': id,
      'school_name': name,
      'school_description': description,
      'school_logoUri': logoUri,
      'school_GOV': gov,
      'school_ministry': ministry,
      'school_email': email,
      'school_status': status == true ? 1 : 0,
      'school_created_at': (createdAt ?? DateTime.now()).toIso8601String(),
      'school_updated_at': (updatedAt ?? DateTime.now()).toIso8601String(),
    };
  }

  // Convert a Map to a SchoolEntity instance
  factory SchoolEntity.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      id: map['school_id'] as int?,
      name: map['school_name'] as String?,
      description: map['school_description'] as String?,
      logoUri: map['school_logoUri'] as String?,
      gov: map['school_GOV'] as String?,
      ministry: map['school_ministry'] as String?,
      email: map['school_email'] as String?,
      status: map['school_status'] != null
          ? (map['school_status'] as int) == 1
          : null,
      createdAt: map['school_created_at'] != null
          ? DateTime.parse(map['school_created_at'])
          : null,
      updatedAt: map['school_updated_at'] != null
          ? DateTime.parse(map['school_updated_at'])
          : null,
    );
  }

  // Convert a JSON string to a SchoolEntity instance
  static SchoolEntity fromString(String data) {
    return SchoolEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
