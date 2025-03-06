import '/backend/entities/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  SubjectModel({
    super.id,
    super.name,
    super.status,
    super.minPoint,
    super.maxPoint,
    super.updatedAt,
    super.createdAt,
  });

  // Override the toString method to include the inherited fields
  @override
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

  // Create a SubjectModel from a Map
  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectEntity.fromMap(map) as SubjectModel;
  }
}
