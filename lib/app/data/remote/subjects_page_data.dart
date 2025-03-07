import 'package:school_controll/core/constants/app_api_links.dart';

import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class SubjectsPageData {
  static Future<ApiResponse> getSubjectsData() async {
    return await ApiTrans.get(AppApiLinks.subjects, {});
  }

  static Future<ApiResponse> insertSubjectsData(
      Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.subjects, data);
  }
}
