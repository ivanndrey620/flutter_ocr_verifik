import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_scanning_model.g.dart';

@JsonSerializable()
class OcrScanningModel {
  final OcrDocumentType documentType;
  @JsonKey(name: 'pro')
  final OcrPro? ocrPro;
  @JsonKey(name: 'prompt')
  final OcrPrompt? ocrPrompt;

  OcrScanningModel({
    required this.documentType,
    required this.ocrPro,
    required this.ocrPrompt,
  });

  factory OcrScanningModel.fromJson(Map<String, dynamic> json) =>
      _$OcrScanningModelFromJson(json);

  Map<String, dynamic> toJson() => _$OcrScanningModelToJson(this);
}
