import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class DioClient {
  static Dio dioIstance = Dio()
    ..options.baseUrl = Endpoints.baseUrl
    ..options.headers = Endpoints.headers
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout;
}
