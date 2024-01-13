import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class DioClient {
  static Dio dioIstance = Dio()
    ..options.baseUrl = Endpoints.ocrBaseUrl
    ..options.headers = Endpoints.ocrHeaders
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout;

  static Dio livenessDioInstance = Dio()
    ..options.baseUrl = Endpoints.livenessBaseUrl
    ..options.headers = Endpoints.livenessHeaders
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout;
}
