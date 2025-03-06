import '/backend/entities/semester_entity.dart';

class SemesterModel extends SemesterEntity {
  SemesterModel({
    super.id,
    super.name,
    super.index,
    super.status,
    super.updatedAt,
    super.createdAt,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert SemesterModel into a Map (inherits from SemesterEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a SemesterModel from a Map
  factory SemesterModel.fromMap(Map<String, dynamic> map) {
    return SemesterEntity.fromMap(map) as SemesterModel;
  }
}
