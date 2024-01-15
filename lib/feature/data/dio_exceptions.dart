import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = StringConstants.cancelApiError;
        break;
      case DioExceptionType.connectionTimeout:
        message = StringConstants.connectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = StringConstants.receiveTimeout;
        break;
      case DioExceptionType.badResponse:
        final response = dioError.response;

        if (response != null) {
          message = '${response.statusCode} - ${StringConstants.unexpected}';

          return;
        }

        message = StringConstants.badResponse;
        break;
      case DioExceptionType.sendTimeout:
        message = StringConstants.receiveTimeout;
        break;
      case DioExceptionType.unknown:
        if (dioError.message?.contains(StringConstants.socketException) ??
            false) {
          message = StringConstants.noInternet;
          break;
        }
        message = StringConstants.unexpected;
        break;
      default:
        message = StringConstants.defaultError;
        break;
    }
  }

  @override
  String toString() => message;
}
