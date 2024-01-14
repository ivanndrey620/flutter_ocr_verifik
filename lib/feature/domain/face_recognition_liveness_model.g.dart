// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_recognition_liveness_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceRecognitionLivenessModel _$FaceRecognitionLivenessModelFromJson(
        Map<String, dynamic> json) =>
    FaceRecognitionLivenessModel(
      livenessScore: (json['liveness_score'] as num).toDouble(),
      passed: json['passed'] as bool,
      minScore: (json['min_score'] as num).toDouble(),
    );

Map<String, dynamic> _$FaceRecognitionLivenessModelToJson(
        FaceRecognitionLivenessModel instance) =>
    <String, dynamic>{
      'liveness_score': instance.livenessScore,
      'passed': instance.passed,
      'min_score': instance.minScore,
    };
