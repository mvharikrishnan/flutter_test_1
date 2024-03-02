import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withError({required DioException error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioExceptionType.unknown:
        _errorMessage =
            _handleCustomResponse(error.response?.statusCode as Response?);

        // = _handleDioResponseError(error.response?.statusCode);
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        break;
      case DioExceptionType.connectionError:
        break;
    }
    return _errorMessage;
  }

  String _handleDioResponseError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  String _handleCustomResponse(Response? response) {
    String? customError;
    if (response?.statusCode == 500) {
      customError =
          "Something went wrong.We're doing our best and we'll back soon.";
    } else {
      customError = response?.data['detail'];
    }

    return customError ?? 'Oops something went wrong';
  }
}
