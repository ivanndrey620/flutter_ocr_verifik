// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParsedResult _$ParsedResultFromJson(Map<String, dynamic> json) => ParsedResult(
      textOverlay:
          TextOverlay.fromJson(json['TextOverlay'] as Map<String, dynamic>),
      textOrientation: json['TextOrientation'] as String,
      fileParseExitCode: json['FileParseExitCode'] as int,
      parsedText: json['ParsedText'] as String,
      errorMessage: json['ErrorMessage'] as String,
      errorDetails: json['ErrorDetails'] as String,
    );

Map<String, dynamic> _$ParsedResultToJson(ParsedResult instance) =>
    <String, dynamic>{
      'TextOverlay': instance.textOverlay,
      'TextOrientation': instance.textOrientation,
      'FileParseExitCode': instance.fileParseExitCode,
      'ParsedText': instance.parsedText,
      'ErrorMessage': instance.errorMessage,
      'ErrorDetails': instance.errorDetails,
    };
