// ignore: file_names
import 'dart:core';

class AppException implements Exception {
  final  _message;
  final  _prefix;

   String toString() {
    return  'mess: $_message || prefix: $_prefix';
  }

  AppException([this._message, this._prefix]);

}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error during communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid input');
}