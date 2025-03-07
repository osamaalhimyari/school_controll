import '/backend/routes/routes_manager.dart';

class ApiTrans {
  ///

  static Future post(String route, Map<String, dynamic> data) async {
    return await RoutesManager.handleRequest("POST", route, data);
  }

  static Future get(String route, Map<String, dynamic> data) async {
    return await RoutesManager.handleRequest("GET", route, data);
  }
}
