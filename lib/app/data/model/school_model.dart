import '/backend/entities/school_entity.dart';

class SchoolModel extends SchoolEntity {
  SchoolModel({
    super.id,
    super.name,
    super.description,
    super.logoUri,
    super.gov,
    super.ministry,
    super.email,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert SchoolModel into a Map (inherits from SchoolEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a SchoolModel from a Map
  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolEntity.fromMap(map) as SchoolModel;
  }
}
