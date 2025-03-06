import '/backend/entities/branch_entity.dart';

// Assuming BranchEntity is already defined in another file
class BranchModel extends BranchEntity {
  BranchModel({
    super.id,
    super.name,
    super.description,
    super.imageUri,
    super.city,
    super.address,
    super.phoneNumber,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  // Override the toString method to include the extra field
  @override
  String toString() {
    String data = super.toString();
    return data;
  }

  // Convert BranchModel into a Map (inherits from BranchEntity)
  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap(); // Get the map from the parent class
    return map;
  }

  // Create a BranchModel from a Map
  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchEntity.fromMap(map) as BranchModel;
  }
}
