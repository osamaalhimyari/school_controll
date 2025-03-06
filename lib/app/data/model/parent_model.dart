import '/backend/entities/parent_entity.dart';

class ParentModel extends ParentEntity {
  ParentModel({
    super.id,
    super.branchId,
    super.imageUri,
    super.name,
    super.description,
    super.status,
    super.phoneNumber,
    super.address,
    super.updatedAt,
    super.createdAt,
  });

  // Override the toString method to include the inherited fields
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

  // Create a ParentModel from a Map
  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentEntity.fromMap(map) as ParentModel;
  }
}
