// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrResultModel _$OcrResultModelFromJson(Map<String, dynamic> json) =>
    OcrResultModel(
      parsedResults: (json['ParsedResults'] as List<dynamic>)
          .map((e) => ParsedResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      ocrExitCode: json['OCRExitCode'] as int,
      isErroredOnProcessing: json['IsErroredOnProcessing'] as bool,
      processingTimeInMilliseconds:
          json['ProcessingTimeInMilliseconds'] as String,
      searchablePdfurl: json['SearchablePDFURL'] as String,
    );

Map<String, dynamic> _$OcrResultModelToJson(OcrResultModel instance) =>
    <String, dynamic>{
      'ParsedResults': instance.parsedResults,
      'OCRExitCode': instance.ocrExitCode,
      'IsErroredOnProcessing': instance.isErroredOnProcessing,
      'ProcessingTimeInMilliseconds': instance.processingTimeInMilliseconds,
      'SearchablePDFURL': instance.searchablePdfurl,
    };
