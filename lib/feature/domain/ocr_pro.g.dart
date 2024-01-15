// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_pro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrPro _$OcrProFromJson(Map<String, dynamic> json) => OcrPro(
      documentType: json['documentType'] as String,
      documentNumber: json['documentNumber'] as String,
      ocrExtraction: json['OCRExtraction'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$OcrProToJson(OcrPro instance) => <String, dynamic>{
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
      'OCRExtraction': instance.ocrExtraction,
    };
