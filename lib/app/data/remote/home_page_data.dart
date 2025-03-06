import '../../../core/api/api_response.dart';
import '../../../core/api/api_trans.dart';

class HomePageData {
  static Future<ApiResponse<Map<String, dynamic>>> insertData(data) async {
    return await ApiTrans.post("schools", data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> getData() async {
    return await ApiTrans.get("schools", {});
  }

  // deleteData() async {
  //   return await ApiTrans.deleteData();
  // }
}
