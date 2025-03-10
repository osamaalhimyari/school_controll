import 'package:school_controll/core/constants/app_api_links.dart';

import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class TeachersPageData {
  static Future<ApiResponse> getTeachersData() async {
    return await ApiTrans.get(AppApiLinks.teachers, {});
  }

  static Future<ApiResponse> insertTeachersData(
      Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.teachers, data);
  }
}
