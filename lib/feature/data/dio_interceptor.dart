import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWFkSWQiOiI2NWEzMWRlMWZjYWRhM2Q0MjQxOWI4ZGYiLCJzZXNzaW9uc0xpbWl0IjoxMDAsInBob25lIjoiNDg4MTAwNzgiLCJpYXQiOjE3MDUxODg4MzN9.INh53brFBDSYtL5hDS5asUqhCOS7R-n6H4gpA-bOHXY';
    super.onRequest(options, handler);
  }
}
