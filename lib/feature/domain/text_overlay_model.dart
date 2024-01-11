import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'text_overlay_model.g.dart';

@JsonSerializable()
class TextOverlay {
  @JsonKey(name: 'Lines')
  final List<Line> lines;
  @JsonKey(name: 'HasOverlay')
  final bool hasOverlay;
  @JsonKey(
    name: 'Message',
    defaultValue: '',
  )
  final String message;

  TextOverlay({
    required this.lines,
    required this.hasOverlay,
    required this.message,
  });

  factory TextOverlay.fromJson(Map<String, dynamic> json) =>
      _$TextOverlayFromJson(json);

  Map<String, dynamic> toJson() => _$TextOverlayToJson(this);
}
