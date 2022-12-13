// Class that helps to show an exception with a custom message
class AppException implements Exception {
  final String errorMessage;

  AppException({required this.errorMessage});
}
