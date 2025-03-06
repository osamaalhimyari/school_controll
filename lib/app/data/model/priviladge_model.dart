import '/backend/entities/priviladge_entity.dart';

class PriviladgeModel extends PriviladgeEntity {
  PriviladgeModel({
    super.id,
    super.name,
    super.status,
    super.data,
    super.updatedAt,
    super.createdAt,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert PriviladgeModel into a Map (inherits from PriviladgeEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a PriviladgeModel from a Map
  factory PriviladgeModel.fromMap(Map<String, dynamic> map) {
    return PriviladgeEntity.fromMap(map) as PriviladgeModel;
  }
}
