import 'package:equatable/equatable.dart';

class ResponseError extends Equatable implements Exception {
  final String message;

  const ResponseError(this.message);

  @override
  List<Object> get props => [message];
}

class CodeResponseError extends ResponseError {
  final int code;

  const CodeResponseError(this.code, String message) : super(message);
}

class NoDataResponseError extends ResponseError {
  const NoDataResponseError() : super('No data!');
}

class NoConnectionResponseError extends ResponseError {
  const NoConnectionResponseError() : super('No connection!');
}

class UnknownResponseError extends ResponseError {
  const UnknownResponseError() : super('Unknown Failure!');
}

class KnownException implements Exception {
  KnownException(this.message);

  final String message;
}
