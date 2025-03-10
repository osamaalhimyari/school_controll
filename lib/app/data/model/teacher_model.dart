import '/backend/entities/teacher_entity.dart';

class TeacherModel extends TeacherEntity {
  TeacherModel({
    super.id,
    super.type,
    super.name,
    super.description,
    super.status,
    super.gender,
    super.birthDate,
    super.phoneNumber,
    super.birthPlace,
    super.address,
    super.updatedAt,
    super.createdAt,
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

  // Create a TeacherModel from a Map
  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherEntity.fromMap(map) as TeacherModel;
  }
}
