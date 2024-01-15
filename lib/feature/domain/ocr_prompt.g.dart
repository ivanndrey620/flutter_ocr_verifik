// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrPrompt _$OcrPromptFromJson(Map<String, dynamic> json) => OcrPrompt(
      documentType: json['documentType'] as String,
      documentNumber: json['documentNumber'] as String,
      ocrExtraction: json['OCRExtraction'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$OcrPromptToJson(OcrPrompt instance) => <String, dynamic>{
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
      'OCRExtraction': instance.ocrExtraction,
    };
