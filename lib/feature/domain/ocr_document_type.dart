import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_document_type.g.dart';

@JsonSerializable()
class OcrDocumentType {
  final String documentType;
  final String country;

  OcrDocumentType({
    required this.documentType,
    required this.country,
  });

  factory OcrDocumentType.fromJson(Map<String, dynamic> json) =>
      _$OcrDocumentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OcrDocumentTypeToJson(this);
}
