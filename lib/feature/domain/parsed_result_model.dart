import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'parsed_result_model.g.dart';

@JsonSerializable()
class ParsedResult {
  @JsonKey(name: 'TextOverlay')
  final TextOverlay textOverlay;
  @JsonKey(name: 'TextOrientation')
  final String textOrientation;
  @JsonKey(name: 'FileParseExitCode')
  final int fileParseExitCode;
  @JsonKey(name: 'ParsedText')
  final String parsedText;
  @JsonKey(name: 'ErrorMessage')
  final String errorMessage;
  @JsonKey(name: 'ErrorDetails')
  final String errorDetails;

  ParsedResult({
    required this.textOverlay,
    required this.textOrientation,
    required this.fileParseExitCode,
    required this.parsedText,
    required this.errorMessage,
    required this.errorDetails,
  });

  factory ParsedResult.fromJson(Map<String, dynamic> json) =>
      _$ParsedResultFromJson(json);

  Map<String, dynamic> toJson() => _$ParsedResultToJson(this);
}
