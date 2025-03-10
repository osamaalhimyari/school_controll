import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/backend/database/db_helper.dart';
import '../../core/api/api_response.dart';
import '../entities/school_entity.dart';

class DatabaseSchoolController {
  static DbHelper dbHelper = Get.find();
  static String tableName = SchoolEntity.tableName;

  //
  static index() async {
    //
  }

  static Future<ApiResponse<Map<String, dynamic>>> show(
      Map<String, dynamic> request) async {
    try {
      final data = await dbHelper.fetch(
        tableName,
      );

      return ApiResponse.success(data.last);
    } catch (e) {
      return ApiResponse.failure(message: "Failed to get school data.");
    }
  }

  static Future<ApiResponse<Map<String, dynamic>>> store(
      Map<String, dynamic> data) async {
    try {
      int res = await dbHelper.insert(tableName, data);

      if (res > 0) {
        var entityData = SchoolEntity.fromMap(data);
        entityData.id = res;
        return ApiResponse.success(entityData.toMap());
      } else {
        return ApiResponse.failure(message: "Failed to insert school data.");
      }
    } catch (e) {
      debugPrint("Error inserting school: $e");
      return ApiResponse.failure(
        message: "An error occurred while inserting school data.",
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
