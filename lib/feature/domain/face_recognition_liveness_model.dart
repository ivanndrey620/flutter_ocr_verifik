import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'face_recognition_liveness_model.g.dart';

@JsonSerializable()
class FaceRecognitionLivenessModel {
  @JsonKey(name: 'liveness_score')
  final double livenessScore;
  final bool passed;
  @JsonKey(name: 'min_score')
  final double minScore;

  FaceRecognitionLivenessModel({
    required this.livenessScore,
    required this.passed,
    required this.minScore,
  });

  String get livenessScoreWithPercentage {
    final rounded = livenessScore * 100;
    return '${rounded.toStringAsFixed(2)} %';
  }

  double get roundedScore {
    final rounded = livenessScore * 100;
    return double.parse(rounded.toStringAsFixed(2));
  }

  double get roundedMinScore {
    final rounded = minScore * 100;
    return double.parse(rounded.toStringAsFixed(2));
  }

  factory FaceRecognitionLivenessModel.fromJson(Map<String, dynamic> json) =>
      _$FaceRecognitionLivenessModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaceRecognitionLivenessModelToJson(this);
}
