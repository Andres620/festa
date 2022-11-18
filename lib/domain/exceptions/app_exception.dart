class AppException implements Exception {
  final String error_message;

  AppException({required this.error_message});
}
