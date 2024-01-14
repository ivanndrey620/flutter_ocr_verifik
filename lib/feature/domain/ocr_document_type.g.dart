// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_document_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrDocumentType _$OcrDocumentTypeFromJson(Map<String, dynamic> json) =>
    OcrDocumentType(
      documentType: json['documentType'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$OcrDocumentTypeToJson(OcrDocumentType instance) =>
    <String, dynamic>{
      'documentType': instance.documentType,
      'country': instance.country,
    };
