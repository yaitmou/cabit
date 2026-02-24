// lib/src/core/errors/failures.dart

import 'package:equatable/equatable.dart';

/// Base failure class that all specific failures extend
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;
  final dynamic data; // Additional error data if needed

  const Failure({required this.message, this.statusCode, this.data});

  @override
  List<Object?> get props => [message, statusCode, data];
}

/// Failure occurred during server communication
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode, super.data});
}

/// Failure occurred during local data caching
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.data});
}

/// Failure due to network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}
