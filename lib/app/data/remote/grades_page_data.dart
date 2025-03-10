import 'package:school_controll/core/api/app_api_links.dart';

import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class GradesPageData {
  static Future<ApiResponse> getGradesData() async {
    return await ApiTrans.get(AppApiLinks.grades, {});
  }

  static Future<ApiResponse> insertGradesData(Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.grades, data);
  }
}
