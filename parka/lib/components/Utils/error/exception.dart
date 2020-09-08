abstract class AppException implements Exception {
  final String _message;
  final String _prefix;
  final Map<String, dynamic> data;

  AppException([this._message, this._prefix, this.data]);

  String toString() {
    return '$_prefix$_message';
  }
}

class ServerException extends AppException {
  ServerException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Error During Communication: ',
          data,
        );
}

class BadRequestException extends AppException {
  BadRequestException([
    message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Invalid Request: ',
          data,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException([
    message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Unauthorised: ',
          data,
        );
}

class CreateUserException extends AppException {
  CreateUserException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Create User Error: ',
          data,
        );
}

class UserInfoException extends AppException {
  UserInfoException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'User Info Error: ',
          data,
        );
}

class UserNotFoundException extends AppException {
  UserNotFoundException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'User Not Found: ',
          data,
        );
}

class NotTokenException extends AppException {
  NotTokenException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Error No token: ',
          data,
        );
}

class LocationServiceException extends AppException {
  LocationServiceException([
    String message,
    Map<String, dynamic> data,
  ]) : super(
          message,
          'Error During Communication LocationService: ',
          data,
        );
}
