import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'word_model.g.dart';

@JsonSerializable()
class Word {
  @JsonKey(name: 'WordText')
  final String wordText;
  @JsonKey(name: 'Left')
  final int left;
  @JsonKey(name: 'Top')
  final int top;
  @JsonKey(name: 'Height')
  final int height;
  @JsonKey(name: 'Width')
  final int width;

  Word({
    required this.wordText,
    required this.left,
    required this.top,
    required this.height,
    required this.width,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
