// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_overlay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextOverlay _$TextOverlayFromJson(Map<String, dynamic> json) => TextOverlay(
      lines: (json['Lines'] as List<dynamic>)
          .map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasOverlay: json['HasOverlay'] as bool,
      message: json['Message'] as String? ?? '',
    );

Map<String, dynamic> _$TextOverlayToJson(TextOverlay instance) =>
    <String, dynamic>{
      'Lines': instance.lines,
      'HasOverlay': instance.hasOverlay,
      'Message': instance.message,
    };
