import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/backend/database/db_helper.dart';
import '/backend/entities/branch_entity.dart';
import '../../core/api/api_response.dart';

class DatabaseBranchController {
  static DbHelper dbHelper = Get.find();
  static String tableName = BranchEntity.tableName;
  //
  static Future<ApiResponse<dynamic>> index(
      Map<String, dynamic> request) async {
    int? id = request['id'];
    try {
      if (id != null) {
        final data = await dbHelper.fetch(tableName,
            where: "branch_id=?", whereArgs: [id], limit: 1);
        if (data.isEmpty) {
          return ApiResponse.success(null);
        }
        return ApiResponse.success(data.first);
      }

      //
      final data = await dbHelper.fetch(tableName);
      if (data.isEmpty) {
        return ApiResponse.success(null);
      }
      return ApiResponse.success(data);
    } catch (e) {
      return ApiResponse.failure(message: "Failed to get branches data .. $e");
    }
  }

  static Future<ApiResponse<Map<String, dynamic>>> store(
      Map<String, dynamic> data) async {
    try {
      int res = await dbHelper.insert(tableName, data);

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
