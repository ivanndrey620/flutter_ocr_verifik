import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_prompt.g.dart';

@JsonSerializable()
class OcrPrompt {
  final String documentType;
  final String documentNumber;
  @JsonKey(name: 'OCRExtraction')
  final Map<String, dynamic> ocrExtraction;

  OcrPrompt({
    required this.documentType,
    required this.documentNumber,
    required this.ocrExtraction,
  });

  factory OcrPrompt.fromJson(Map<String, dynamic> json) =>
      _$OcrPromptFromJson(json);

  Map<String, dynamic> toJson() => _$OcrPromptToJson(this);
}
