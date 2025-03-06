class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final String? error;
  final ResponseStatus? status;

  ApiResponse.success(this.data)
      : success = true,
        message = null,
        status = ResponseStatus.success,
        error = null;

  ApiResponse.failure(
      {this.status = ResponseStatus.failure, this.message, this.error})
      : success = false,
        data = null;

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "data": data,
      "message": message,
      "error": error,
      "status": status,
    };
  }
}

enum ResponseStatus {
  loading,
  success,
  failure,
  serverFailure,
  serverException,
  offlineFailure,
  unuthrized,
  none,
}
