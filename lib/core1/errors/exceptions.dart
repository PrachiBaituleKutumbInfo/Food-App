import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException(this.message);

  @override
  List<Object?> get props => [message];
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  @override
  String toString() => 'NetworkException: $message';
}

class AuthenticationException extends Equatable implements Exception {
  final String message;

  const AuthenticationException(this.message);

  @override
  List<Object?> get props => [message];
}

class ValidationException extends Equatable implements Exception {
  final String message;

  const ValidationException(this.message);

  @override
  List<Object?> get props => [message];
}

class NotFoundException extends Equatable implements Exception {
  final String message;

  const NotFoundException(this.message);

  @override
  List<Object?> get props => [message];
}

class PermissionDeniedException extends Equatable implements Exception {
  final String message;

  const PermissionDeniedException(this.message);

  @override
  List<Object?> get props => [message];
}

class TimeoutException extends Equatable implements Exception {
  final String message;

  const TimeoutException(this.message);

  @override
  List<Object?> get props => [message];
}
