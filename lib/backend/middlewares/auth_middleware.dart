import '../../core/api/api_response.dart';

Future<ApiResponse<Map<String, dynamic>>> authMiddleware(
    Map<String, dynamic> data, next) async {
  if (!data.containsKey("authToken") || data["authToken"].isEmpty) {
    return ApiResponse.failure(message: "Unauthorized access");
  }

  return next(data);
}
