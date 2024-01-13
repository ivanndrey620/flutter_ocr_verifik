// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveness_detection_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivenessDetectionResultModel _$LivenessDetectionResultModelFromJson(
        Map<String, dynamic> json) =>
    LivenessDetectionResultModel(
      score: (json['score'] as num).toDouble(),
      result: json['result'] as String,
    );

Map<String, dynamic> _$LivenessDetectionResultModelToJson(
        LivenessDetectionResultModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'result': instance.result,
    };
