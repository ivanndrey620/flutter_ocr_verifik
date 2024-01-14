import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'compare_faces_result.g.dart';

@JsonSerializable()
class CompareFacesResult {
  final double score;

  CompareFacesResult({required this.score});

  double get roundedScore {
    final rounded = score * 100;
    return double.parse(rounded.toStringAsFixed(2));
  }

  String get scoreWithPercentage {
    final rounded = score * 100;
    return '${rounded.toStringAsFixed(2)} %';
  }

  factory CompareFacesResult.fromJson(Map<String, dynamic> json) =>
      _$CompareFacesResultFromJson(json);

  Map<String, dynamic> toJson() => _$CompareFacesResultToJson(this);
}
