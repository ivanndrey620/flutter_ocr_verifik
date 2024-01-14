class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://demo.verifik.co/v2';

  static const Duration receiveTimeout = Duration(milliseconds: 20000);

  static const Duration connectionTimeout = Duration(milliseconds: 20000);

  static const Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWFkSWQiOiI2NWEzMWRlMWZjYWRhM2Q0MjQxOWI4ZGYiLCJzZXNzaW9uc0xpbWl0IjoxMDAsInBob25lIjoiNDg4MTAwNzgiLCJpYXQiOjE3MDUxODg4MzN9.INh53brFBDSYtL5hDS5asUqhCOS7R-n6H4gpA-bOHXY',
  };
}
