// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      wordText: json['WordText'] as String,
      left: json['Left'] as int,
      top: json['Top'] as int,
      height: json['Height'] as int,
      width: json['Width'] as int,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'WordText': instance.wordText,
      'Left': instance.left,
      'Top': instance.top,
      'Height': instance.height,
      'Width': instance.width,
    };
