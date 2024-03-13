class ApiConnectionError implements Exception {
  final String errorMessage;

  const ApiConnectionError({
    required this.errorMessage,
  });
}
