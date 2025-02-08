// lib/core/error/failures.dart

/// Classe base para falhas (failures) que podem ocorrer na aplicação.
abstract class Failure {
  final String message;

  const Failure(this.message);
}

/// Falha que representa erros provenientes do servidor.
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Falha que representa erros no cache ou armazenamento local.
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
