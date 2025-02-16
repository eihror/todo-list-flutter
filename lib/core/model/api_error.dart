class ApiErrors {
  ApiErrors({
    required this.errors,
  });

  final List<ApiError> errors;

  factory ApiErrors.fromMap(Map<String, dynamic> map) {
    return ApiErrors(
      errors: (map['errors'] as List<dynamic>?)
          ?.map((e) => ApiError.fromMap(e))
          .toList() ??
          List.empty(),
    );
  }
}

class ApiError {
  ApiError({
    this.field,
    this.message,
    required this.code,
  });

  final String? field;
  final String? message;
  final int code;

  factory ApiError.fromMap(Map<String, dynamic> map) {
    return ApiError(
      field: map['field'] as String?,
      message: map['message'] as String? ?? "",
      code: map['code'] as int? ?? -1,
    );
  }
}
