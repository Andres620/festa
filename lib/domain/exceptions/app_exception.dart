class AppException implements Exception {
  final String errorMessage;

  AppException({required this.errorMessage});
}
