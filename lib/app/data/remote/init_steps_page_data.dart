import 'package:school_controll/core/api/app_api_links.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class InitStepsPageData {
  static Future<ApiResponse<Map<String, dynamic>>> insertSchoolData(
      Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.schools, data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> getSchoolData() async {
    return await ApiTrans.get(AppApiLinks.schools, {});
  }

  static Future<ApiResponse<Map<String, dynamic>>> insertBranchData(
      Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.branches, data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> getBranchData() async {
    return await ApiTrans.get(AppApiLinks.branches, {});
  }

  // static Future<ApiResponse<Map<String, dynamic>>> insertTeacherData(
  //     Map<String, dynamic> data) async {
  //   return await ApiTrans.post(AppApiLinks.showTeacher, data);
  // }

  // static Future<ApiResponse<Map<String, dynamic>>> getTeacherData() async {
  //   return await ApiTrans.get(AppApiLinks.showTeacher, {});
  // }
}
