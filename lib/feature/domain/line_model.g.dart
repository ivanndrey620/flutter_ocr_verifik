// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) => Line(
      lineText: json['LineText'] as String,
      words: (json['Words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxHeight: json['MaxHeight'] as int,
      minTop: json['MinTop'] as int,
    );

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'LineText': instance.lineText,
      'Words': instance.words,
      'MaxHeight': instance.maxHeight,
      'MinTop': instance.minTop,
    };
