import 'api_response.dart';
import '/backend/routes/routes_manager.dart';

class ApiTrans {
  ///

  static Future<ApiResponse<Map<String, dynamic>>> post(
      String route, Map<String, dynamic> data) async {
    return await RoutesManager.handleRequest("POST", route, data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> get(
      String route, Map<String, dynamic> data) async {
    return await RoutesManager.handleRequest("GET", route, data);
  }
}
