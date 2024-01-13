import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'liveness_detection_result_model.g.dart';

@JsonSerializable()
class LivenessDetectionResultModel {
  final double score;
  final String result;

  LivenessDetectionResultModel({
    required this.score,
    required this.result,
  });

  factory LivenessDetectionResultModel.fromJson(Map<String, dynamic> json) =>
      _$LivenessDetectionResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LivenessDetectionResultModelToJson(this);
}
