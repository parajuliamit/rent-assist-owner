import 'package:dio/dio.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";
  Map<String, dynamic>? _error;

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  int getErrorCode() {
    return _errorCode;
  }

  String getErrorMessage() {
    return _errorMessage;
  }

  Map<String, dynamic>? getError() {
    return _error;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        // _errorMessage = "Check your internet connection";
        _errorMessage = error.error.toString();
        if (_errorMessage.contains("SocketException")) {
          _errorMessage = "Check your internet connection";
        }

        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        _errorCode = error.response!.statusCode!;

        _errorMessage =
            "Received invalid status code: ${error.response!.statusCode}";
        try {
          _errorMessage = error.message.toString();
          if (error.response!.data["detail"] != null) {
            _errorMessage = error.response!.data["detail"].toString();
          }
          if (error.response!.data["message"] != null) {
            _errorMessage = error.response!.data["message"].toString();
          }
          if (error.response!.data is Map<String, dynamic>) {
            _error = error.response!.data;
          }
          // else if (error.response!.data["error"] != null) {
          //   _error = error.response!.data["error"];
          // }
        } catch (e) {
          print("Error response = " + e.toString());
        }
        if (_errorCode >= 500 && _errorCode <= 599) {
          _errorMessage = '$_errorCode: Server Error';
        }
        if (_errorCode == 502) {
          _errorMessage =
              'We are under maintenance. Please try again in a moment. Thank you.';
        }
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
    }
    return _errorMessage;
  }
}
