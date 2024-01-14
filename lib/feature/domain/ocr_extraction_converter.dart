import 'package:flutter_ocr_verifik/utils/export_files.dart';

class OcrExtractionConverter implements JsonConverter<String, dynamic> {
  const OcrExtractionConverter();

  @override
  String fromJson(json) {
    final result = jsonEncode(json);

    return result;
  }

  @override
  toJson(String object) => object;
}
