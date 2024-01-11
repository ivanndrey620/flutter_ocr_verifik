import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_result_model.g.dart';

@JsonSerializable()
class OcrResultModel {
  @JsonKey(name: 'ParsedResults')
  final List<ParsedResult> parsedResults;
  @JsonKey(name: 'OCRExitCode')
  final int ocrExitCode;
  @JsonKey(name: 'IsErroredOnProcessing')
  final bool isErroredOnProcessing;
  @JsonKey(name: 'ProcessingTimeInMilliseconds')
  final String processingTimeInMilliseconds;
  @JsonKey(name: 'SearchablePDFURL')
  final String searchablePdfurl;

  OcrResultModel({
    required this.parsedResults,
    required this.ocrExitCode,
    required this.isErroredOnProcessing,
    required this.processingTimeInMilliseconds,
    required this.searchablePdfurl,
  });

  factory OcrResultModel.fromJson(Map<String, dynamic> json) =>
      _$OcrResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$OcrResultModelToJson(this);
}
