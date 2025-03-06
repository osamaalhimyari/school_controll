import 'dart:convert';

import 'package:flutter/foundation.dart';
import '/app/data/model/year_model.dart';

class YearEntity {
  int? id;
  String name;
  bool status;
  Map<String, dynamic>? configData; // Nullable configData
  DateTime updatedAt;
  DateTime createdAt;

  YearEntity({
    this.id,
    required this.name,
    required this.status,
    this.configData, // configData is now nullable
    required this.updatedAt,
    required this.createdAt,
  });

  // Convert a YearEntity into a Map for SQL insertion
  Map<String, dynamic> toMap() {
    return {
      'year_id': id,
      'year_name': name,
      'year_status': status ? 1 : 0,
      'year_config_data': configData != null
          ? jsonEncode(configData)
          : null, // Check if configData is not null
      'year_updated_at': updatedAt.toIso8601String(),
      'year_created_at': createdAt.toIso8601String(),
    };
  }

  // Convert a Map to a YearEntity instance
  factory YearEntity.fromMap(Map<String, dynamic> map) {
    return YearModel(
      id: map['year_id'],
      name: map['year_name'],
      status: map['year_status'] == 1,
      configData: _parseConfigData(
          map['year_config_data']), // Safe parsing with nullable support
      updatedAt: DateTime.parse(map['year_updated_at']),
      createdAt: DateTime.parse(map['year_created_at']),
    );
  }

  // Safe parsing of the configData, returns null if configData is not provided or invalid
  static Map<String, dynamic>? _parseConfigData(dynamic configData) {
    if (configData == null) return null; // Return null if no data is provided

    try {
      return jsonDecode(configData);
    } catch (e) {
      debugPrint("Error decoding configData: $e");
      return null; // Return null if decoding fails
    }
  }

  // This can be used to convert a model into a JSON string for storage or network
  static YearEntity fromString(String data) {
    return YearEntity.fromMap(jsonDecode(data));
  }

  // For comparison in testing
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
