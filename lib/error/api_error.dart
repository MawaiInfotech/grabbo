
import 'dart:async';
import 'dart:io';

class ApiError {
  final String message;
  const ApiError._(this.message);

  factory ApiError.fromError(error){
    if(error is TimeoutException) return ApiError.timeOut();
    if(error is SocketException) return ApiError.internet();
    if(error is String) return ApiError._(error);
    if(error is ApiError) return error;
    return ApiError.unKnown();
  }

  factory ApiError.internet() =>
      const ApiError._('Check your internet connection');
  factory ApiError.timeOut() =>
      const ApiError._('Timeout has been reached. Please try again later');
  factory ApiError.invalidDetails() =>
      const ApiError._('Login failed. Invalid Details');
  factory ApiError.fromResponse(String error) => ApiError._(error);
  factory ApiError.unKnown() => const ApiError._('An unknown error occurred');
}