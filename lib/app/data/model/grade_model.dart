import '/backend/entities/grade_entity.dart';

class GradeModel extends GradeEntity {
  GradeModel({
    super.id,
    super.name,
    super.description,
    super.stage,
    super.status,
    super.updatedAt,
    super.createdAt,
    super.capacity,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert GradeModel into a Map (inherits from GradeEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a GradeModel from a Map
  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeEntity.fromMap(map) as GradeModel;
  }
}
