import '/backend/entities/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    super.id,
    required super.branchId,
    required super.parentId,
    required super.relationName,
    required super.branchImageUri,
    required super.name,
    required super.description,
    required super.gender,
    required super.status,
    required super.phoneNumber,
    required super.birthDate,
    super.birthPlace,
    required super.address,
    required super.createdAt,
    required super.updatedAt,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert StudentModel into a Map (inherits from StudentEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a StudentModel from a Map
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentEntity.fromMap(map) as StudentModel;
  }
}
