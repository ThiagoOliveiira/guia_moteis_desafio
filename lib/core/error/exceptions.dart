// lib/core/error/exceptions.dart

/// Enum que define os tipos de erro HTTP que podem ocorrer.
enum HttpError {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  unprocessableEntity,
  serverError,
}

/// Exceção personalizada para erros HTTP.
/// Essa exceção encapsula o tipo de erro (HttpError), uma mensagem descritiva e a URL da requisição.
class CustomHttpException implements Exception {
  final HttpError httpError;
  final String message;
  final String urlRequest;

  CustomHttpException({required this.httpError, required this.message, required this.urlRequest});

  @override
  String toString() {
    return 'CustomHttpException: $message (HTTP Error: ${httpError.name}, URL: $urlRequest)';
  }
}
