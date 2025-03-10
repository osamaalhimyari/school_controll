import 'package:school_controll/core/api/app_api_links.dart';

import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class BranchesPageData {
  static Future<ApiResponse> getBranches() async {
    return await ApiTrans.get(AppApiLinks.branches, {});
  }

  static Future<ApiResponse> insertBranch(Map<String, dynamic> data) async {
    return await ApiTrans.post(AppApiLinks.branches, data);
  }
}
