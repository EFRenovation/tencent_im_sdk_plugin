// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_sound_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimSoundElem _$V2TimSoundElemFromJson(Map<String, dynamic> json) {
  return V2TimSoundElem(
    json['path'] as String?,
    json['UUID'] as String?,
    json['dataSize'] as int?,
    json['duration'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$V2TimSoundElemToJson(V2TimSoundElem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'UUID': instance.UUID,
      'dataSize': instance.dataSize,
      'duration': instance.duration,
      'url': instance.url,
    };
