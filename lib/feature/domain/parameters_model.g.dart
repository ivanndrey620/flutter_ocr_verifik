// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParametesModel _$ParametesModelFromJson(Map<String, dynamic> json) =>
    ParametesModel(
      language: json['language'] as String,
      isOverlayRequired: json['isOverlayRequired'] as bool,
      oCREngine: json['oCREngine'] as int,
    );

Map<String, dynamic> _$ParametesModelToJson(ParametesModel instance) =>
    <String, dynamic>{
      'language': instance.language,
      'isOverlayRequired': instance.isOverlayRequired,
      'oCREngine': instance.oCREngine,
    };
