import '/backend/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  ResultModel({
    super.id,
    required super.branchId,
    required super.studentId,
    required super.gradeId,
    required super.yearId,
    super.data,
  });

  // Override the toString method to include the inherited fields
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert ResultModel into a Map (inherits from ResultEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a ResultModel from a Map
  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultEntity.fromMap(map) as ResultModel;
  }
}
