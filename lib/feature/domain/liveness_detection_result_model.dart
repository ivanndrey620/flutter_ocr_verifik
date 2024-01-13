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

  String get scoreFixed {
    final fix = score * 100;

    return '${fix.toStringAsFixed(2)} %';
  }

  double get roundedScore {
    final rounded = score * 100;

    return rounded;
  }

  bool get resultIs {
    if (result == 'fake') return false;
    return true;
  }

  factory LivenessDetectionResultModel.fromJson(Map<String, dynamic> json) =>
      _$LivenessDetectionResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LivenessDetectionResultModelToJson(this);
}
