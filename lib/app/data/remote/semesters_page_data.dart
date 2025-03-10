import 'package:school_controll/core/constants/app_api_links.dart';

import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class SemestersPageData {
  static Future<ApiResponse> getSemestersData() async {
    return await ApiTrans.get(AppApiLinks.semesters, {});
  }

  static Future<ApiResponse> insertSemestersData(
      Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.semesters, data);
  }
}
