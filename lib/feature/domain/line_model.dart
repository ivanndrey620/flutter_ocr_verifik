import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'line_model.g.dart';

@JsonSerializable()
class Line {
  @JsonKey(name: 'LineText')
  final String lineText;
  @JsonKey(name: 'Words')
  final List<Word> words;
  @JsonKey(name: 'MaxHeight')
  final int maxHeight;
  @JsonKey(name: 'MinTop')
  final int minTop;

  Line({
    required this.lineText,
    required this.words,
    required this.maxHeight,
    required this.minTop,
  });

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
}
