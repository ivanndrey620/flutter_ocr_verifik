import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_pro.g.dart';

@JsonSerializable()
class OcrPro {
  final String documentType;
  final String documentNumber;
  @JsonKey(name: 'OCRExtraction')
  final Map<String, dynamic> ocrExtraction;

  OcrPro({
    required this.documentType,
    required this.documentNumber,
    required this.ocrExtraction,
  });

  factory OcrPro.fromJson(Map<String, dynamic> json) => _$OcrProFromJson(json);

  Map<String, dynamic> toJson() => _$OcrProToJson(this);
}
