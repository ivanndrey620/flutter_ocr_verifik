// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_scanning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrScanningModel _$OcrScanningModelFromJson(Map<String, dynamic> json) =>
    OcrScanningModel(
      documentType: OcrDocumentType.fromJson(
          json['documentType'] as Map<String, dynamic>),
      ocrPro: json['pro'] == null
          ? null
          : OcrPro.fromJson(json['pro'] as Map<String, dynamic>),
      ocrPrompt: json['prompt'] == null
          ? null
          : OcrPrompt.fromJson(json['prompt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OcrScanningModelToJson(OcrScanningModel instance) =>
    <String, dynamic>{
      'documentType': instance.documentType,
      'pro': instance.ocrPro,
      'prompt': instance.ocrPrompt,
    };
