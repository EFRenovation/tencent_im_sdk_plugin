// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimImage _$V2TimImageFromJson(Map<String, dynamic> json) {
  return V2TimImage(
    json['UUID'] as String?,
    json['type'] as int?,
    json['size'] as int?,
    json['width'] as int?,
    json['height'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$V2TimImageToJson(V2TimImage instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'type': instance.type,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
