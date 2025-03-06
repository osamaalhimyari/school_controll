import '../../core/api/api_response.dart';

typedef RouteHandler = Future<ApiResponse<Map<String, dynamic>>> Function(
    Map<String, dynamic> data);
typedef Middleware = Future<ApiResponse<Map<String, dynamic>>> Function(
    Map<String, dynamic> data, RouteHandler next);

class RoutesManager {
  static final List<_Route> _routes = [];

  // Define GET Route with optional middlewares
  static void get(String path, RouteHandler handler,
      {List<Middleware> middlewares = const []}) {
    _routes.add(_Route(
        method: "GET", path: path, handler: handler, middlewares: middlewares));
  }

  // Define POST Route with optional middlewares
  static void post(String path, RouteHandler handler,
      {List<Middleware> middlewares = const []}) {
    _routes.add(_Route(
        method: "POST",
        path: path,
        handler: handler,
        middlewares: middlewares));
  }

  // Resolve a request
  static Future<ApiResponse<Map<String, dynamic>>> handleRequest(
      String method, String path, Map<String, dynamic> data) async {
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
  static Future<ApiResponse<Map<String, dynamic>>> _applyMiddleware(
      List<Middleware> middlewares,
      RouteHandler handler,
      Map<String, dynamic> data) async {
    if (middlewares.isEmpty) {
      return handler(data);
    }

    Middleware first = middlewares.first;
    List<Middleware> remainingMiddleware = middlewares.sublist(1);

    return first(data,
        (nextData) => _applyMiddleware(remainingMiddleware, handler, nextData));
  }
}

class _Route {
  final String method;
  final String path;
  final RouteHandler handler;
  final List<Middleware> middlewares;

  _Route(
      {required this.method,
      required this.path,
      required this.handler,
      required this.middlewares});
}
