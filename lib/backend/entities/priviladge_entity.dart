import 'dart:convert';
import 'package:school_controll/backend/database/schemas/priviladge_schema.dart';

import '/app/data/model/priviladge_model.dart';

class PriviladgeEntity {
  static const tableName = PriviladgeSchema.tableName;

  int? id;
  String? name;
  bool? status;
  String? data;
  DateTime? updatedAt;
  DateTime? createdAt;

  PriviladgeEntity({
    this.id,
    this.name,
    this.status,
    this.data,
    this.updatedAt,
    this.createdAt,
  });

  // Convert a PriviladgeEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'priviladge_id': id,
      'priviladge_name': name,
      'priviladge_status': status != null ? (status! ? 1 : 0) : null,
      'priviladge_data': data,
      'priviladge_updated_at': updatedAt?.toIso8601String(),
      'priviladge_created_at': createdAt?.toIso8601String(),
    };
  }

  // Convert a Map to a PriviladgeEntity instance
  factory PriviladgeEntity.fromMap(Map<String, dynamic> map) {
    return PriviladgeModel(
      id: map['priviladge_id'] as int?,
      name: map['priviladge_name'] as String?,
      status: map['priviladge_status'] != null
          ? (map['priviladge_status'] == 1)
          : null,
      data: map['priviladge_data'] as String?,
      updatedAt: map['priviladge_updated_at'] != null
          ? DateTime.parse(map['priviladge_updated_at'])
          : null,
      createdAt: map['priviladge_created_at'] != null
          ? DateTime.parse(map['priviladge_created_at'])
          : null,
    );
  }

  // This can be used to convert a model into a JSON string for storage or network
  static PriviladgeEntity fromString(String data) {
    return PriviladgeEntity.fromMap(jsonDecode(data));
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
