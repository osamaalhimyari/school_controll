import '/backend/entities/estimate_entity.dart';

class EstimateModel extends EstimateEntity {
  EstimateModel({
    super.id,
    super.name,
    super.fromValue,
    super.toValue,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert EstimateModel into a Map (inherits from EstimateEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create an EstimateModel from a Map
  factory EstimateModel.fromMap(Map<String, dynamic> map) {
    return EstimateEntity.fromMap(map) as EstimateModel;
  }
}
