import '/backend/entities/year_entity.dart';

class YearModel extends YearEntity {
  YearModel({
    super.id,
    required super.name,
    required super.status,
    super.configData,
    required super.updatedAt,
    required super.createdAt,
  });

  // Override the toString method to include inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert ParentModel into a Map (inherits from ParentEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a YearModel from a Map
  factory YearModel.fromMap(Map<String, dynamic> map) {
    return YearEntity.fromMap(map) as YearModel;
  }
}
