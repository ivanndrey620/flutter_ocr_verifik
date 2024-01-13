class Endpoints {
  Endpoints._();

  static const String ocrApiKey = 'K86630402888957';
  static const String ocrBaseUrl = 'https://api.ocr.space';

  static const String livenessApiKey = '2616080721e145abb63c32c219167a10';
  static const String livenessBaseUrl = 'https://api.luxand.cloud';

  static const Duration receiveTimeout = Duration(milliseconds: 20000);

  static const Duration connectionTimeout = Duration(milliseconds: 20000);

  static const Map<String, dynamic> ocrHeaders = {
    'apikey': ocrApiKey,
    'Content-Type': 'multipart/form-data'
  };

  static const Map<String, dynamic> livenessHeaders = {
    'token': livenessApiKey,
    'Content-Type': 'multipart/form-data'
  };
}
