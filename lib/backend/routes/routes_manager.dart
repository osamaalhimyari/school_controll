import '../../core/api/api_response.dart';

// typedef dynamic = Future Function(data);
// typedef Middleware = Future Function(dynamic data, dynamic next);

class RoutesManager {
  static final List<_Route> _routes = [];

  // Define GET Route with optional middlewares
  static void get(String path, dynamic handler, {List middlewares = const []}) {
    _routes.add(_Route(
        method: "GET", path: path, handler: handler, middlewares: middlewares));
  }

  // Define POST Route with optional middlewares
  static void post(String path, dynamic handler,
      {List middlewares = const []}) {
    _routes.add(_Route(
        method: "POST",
        path: path,
        handler: handler,
        middlewares: middlewares));
  }

  // Resolve a request
  static Future<ApiResponse> handleRequest(
      String method, String path, dynamic data) async {
    final route = _routes.firstWhere(
      (r) => r.method == method && r.path == path,
      orElse: () => _Route(
        method: method,
        path: path,
        handler: (_) async => ApiResponse.failure(message: "Route not found"),
        middlewares: [],
      ),
    );

    return _applyMiddleware(route.middlewares, route.handler, data);
  }

  // Apply middlewares in order before calling the handler
  static Future<ApiResponse> _applyMiddleware(
      List middlewares, handler, data) async {
    if (middlewares.isEmpty) {
      return handler(data);
    }

    var first = middlewares.first;
    List remainingMiddleware = middlewares.sublist(1);

    return first(data,
        (nextData) => _applyMiddleware(remainingMiddleware, handler, nextData));
  }
}

class _Route {
  final String method;
  final String path;
  final dynamic handler;
  final List middlewares;

  _Route(
      {required this.method,
      required this.path,
      required this.handler,
      required this.middlewares});
}
