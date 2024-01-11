import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'parameters_model.g.dart';

@JsonSerializable()
class ParametesModel {
  final String language;
  final bool isOverlayRequired;
  final int oCREngine;

  ParametesModel({
    required this.language,
    required this.isOverlayRequired,
    required this.oCREngine,
  });

  factory ParametesModel.fromJson(Map<String, dynamic> json) =>
      _$ParametesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParametesModelToJson(this);
}
