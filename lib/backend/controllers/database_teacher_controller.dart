import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_controll/backend/database/schemas/teacher_schema.dart';
import 'package:school_controll/backend/entities/teacher_entity.dart';
import '/backend/database/db_helper.dart';
import '../../core/api/api_response.dart';

class DatabaseTeacherController {
  static DbHelper dbHelper = Get.find();
  static String teacherTableName = TeacherSchema.tableName;

  //
  static index() async {
    //
  }

  static Future<ApiResponse<Map<String, dynamic>>> show(
      Map<String, dynamic> request) async {
    int? id = request['id'];
    if (id == null) {
      return ApiResponse.failure(message: "id is requierd");
    }
    try {
      final data = await dbHelper.fetch(teacherTableName,
          where: "teacher_id=?", whereArgs: [id], limit: 1);
      if (data.isEmpty) {
        return ApiResponse.success(null);
      }
      return ApiResponse.success(data.first);
    } catch (e) {
      return ApiResponse.failure(message: "Failed to get teacher data.");
    }
  }

  static Future<ApiResponse<Map<String, dynamic>>> store(
      Map<String, dynamic> data) async {
    try {
      int res = await dbHelper.insert(teacherTableName, data);

      if (res > 0) {
        var entityData = TeacherEntity.fromMap(data);
        entityData.id = res;
        return ApiResponse.success(entityData.toMap());
      } else {
        return ApiResponse.failure(message: "Failed to insert teacher data.");
      }
    } catch (e) {
      debugPrint("Error inserting teacher: $e");
      return ApiResponse.failure(
        message: "An error occurred while inserting teacher data.",
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
