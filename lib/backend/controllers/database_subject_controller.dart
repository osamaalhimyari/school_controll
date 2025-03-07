import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/backend/database/schemas/subject_schema.dart';
import 'package:school_controll/backend/entities/subject_entity.dart';

import '/backend/database/db_helper.dart';
import '../../core/api/api_response.dart';

class DatabaseSubjectController {
  static DbHelper dbHelper = Get.find();
  static String tableName = SubjectSchema.tableName;

  //
  static Future<ApiResponse<List<Map<String, dynamic>>?>> index(
      Map<String, dynamic> request) async {
    try {
      final data = await dbHelper.fetch(tableName);
      if (data.isEmpty) {
        return ApiResponse.success(null);
      }
      return ApiResponse.success(data);
    } catch (e) {
      return ApiResponse.failure(message: "Failed to get subject data.");
    }
  }

  // static Future<ApiResponse<Map<String, dynamic>>> show(
  //     Map<String, dynamic> request) async {
  //   // int? id = request['id'];
  //   // if (id == null) {
  //   //   return ApiResponse.failure(message: "id is requierd");
  //   // }
  //   // try {
  //   //   final data = await dbHelper.fetch(tableName,
  //   //       where: "subjects_id=?", whereArgs: [id], limit: 1);
  //   //   if (data.isEmpty) {
  //   //     return ApiResponse.success(null);
  //   //   }
  //   //   return ApiResponse.success(data.first);
  //   // } catch (e) {
  //   //   return ApiResponse.failure(message: "Failed to get subject data.");
  //   // }
  // }

  static Future<ApiResponse<Map<String, dynamic>>> store(
      Map<String, dynamic> data) async {
    try {
      int res = await dbHelper.insert(tableName, data);

      if (res > 0) {
        var entityData = SubjectEntity.fromMap(data);
        entityData.id = res;
        return ApiResponse.success(entityData.toMap());
      } else {
        return ApiResponse.failure(message: "Failed to insert subject data.");
      }
    } catch (e) {
      debugPrint("Error inserting subject: $e");
      return ApiResponse.failure(
        message: "An error occurred while inserting subject data.",
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
