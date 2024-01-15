class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://demo.verifik.co/v2';

  static const Duration receiveTimeout = Duration(milliseconds: 20000);

  static const Duration connectionTimeout = Duration(milliseconds: 20000);

  static const Map<String, dynamic> headers = {
    'Content-Type': 'application/json'
  };
}
