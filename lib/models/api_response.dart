class ApiResponse<T> {
  final bool success;
  final T data;
  final String? message;

  ApiResponse({required this.success, required this.data, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ApiResponse(
      success: json['success'] as bool,
      data: fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }
}