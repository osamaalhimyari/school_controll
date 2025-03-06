import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/backend/database/db_helper.dart';
import '/backend/database/schemas/branch_schema.dart';
import '/backend/entities/branch_entity.dart';

import '../../core/api/api_response.dart';

class DatabaseBranchController {
  static DbHelper dbHelper = Get.find();
  static String branchTableName = BranchSchema.tableName;
  //
  static index() async {
    //
  }

  static Future<ApiResponse<Map<String, dynamic>>> show(
      Map<String, dynamic> request) async {
    int id = 1;
    try {
      var data = await dbHelper.fetch(
        branchTableName,
        where: "branch_id=?",
        whereArgs: [id],
      );
      if (data.isEmpty) {
        return ApiResponse.success(null);
      }
      return ApiResponse.success(data.first);
    } catch (e) {
      return ApiResponse.failure(message: "Failed to get branch data.");
    }
  }

  static Future<ApiResponse<Map<String, dynamic>>> store(
      Map<String, dynamic> data) async {
    try {
      int res = await dbHelper.insert(branchTableName, data);

      if (res > 0) {
        var entityData = BranchEntity.fromMap(data);
        entityData.id = res;
        return ApiResponse.success(entityData.toMap());
      } else {
        return ApiResponse.failure(message: "Failed to insert branch data.");
      }
    } catch (e) {
      debugPrint("Error inserting branch: $e");
      return ApiResponse.failure(
        message: "An error occurred while inserting branch data.",
        error: e.toString(),
      );
    }
  }

  static update(Map<String, dynamic> request) {
    //
  }
  static delete(Map<String, dynamic> request) {
    //
  }
}
