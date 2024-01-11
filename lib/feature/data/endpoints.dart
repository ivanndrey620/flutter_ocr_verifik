class Endpoints {
  Endpoints._();

  static const String apiKey = 'K86630402888957';

  static const String baseUrl = 'https://api.ocr.space';

  static const Duration receiveTimeout = Duration(milliseconds: 20000);

  static const Duration connectionTimeout = Duration(milliseconds: 20000);

  static const Map<String, dynamic> headers = {
    'apikey': apiKey,
    'Content-Type': 'multipart/form-data'
  };
}
