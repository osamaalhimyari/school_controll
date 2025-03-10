import '/backend/routes/routes_manager.dart';

class ApiTrans {
  ///

  static Future post(String route, Map<String, dynamic> data) async {
    var response = await RoutesManager.handleRequest("POST", route, data);
    if (!response.success) {
      print("${response.error}");
    }
    return response;
  }

  static Future get(String route, Map<String, dynamic> data) async {
    var response = await RoutesManager.handleRequest("GET", route, data);
    if (!response.success) {
      print("${response.error}");
    }
    return response;
  }
}
