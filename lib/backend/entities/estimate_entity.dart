import 'dart:convert';

import 'package:school_controll/backend/database/schemas/estimate_schema.dart';

import '/app/data/model/estimate_model.dart';

class EstimateEntity {
  static const tableName = EstimateSchema.tableName;

  int? id;
  String? name;
  int? fromValue;
  int? toValue;

  EstimateEntity({
    this.id,
    this.name,
    this.fromValue,
    this.toValue,
  });

  // Convert an EstimateEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'estimate_id': id,
      'estimate_name': name,
      'estimate_from_value': fromValue,
      'estimate_to_value': toValue,
    };
  }

  // Convert a Map to an EstimateEntity instance
  factory EstimateEntity.fromMap(Map<String, dynamic> map) {
    return EstimateModel(
      id: map['estimate_id'],
      name: map['estimate_name'],
      fromValue: map['estimate_from_value'],
      toValue: map['estimate_to_value'],
    );
  }

  // For comparison in testing
  static EstimateEntity fromString(String data) {
    return EstimateEntity.fromMap(jsonDecode(data));
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
