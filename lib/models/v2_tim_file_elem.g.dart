// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_file_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFileElem _$V2TimFileElemFromJson(Map<String, dynamic> json) {
  return V2TimFileElem(
    json['path'] as String?,
    json['fileName'] as String?,
    json['UUID'] as String?,
    json['fileSize'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$V2TimFileElemToJson(V2TimFileElem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'fileName': instance.fileName,
      'UUID': instance.uUID,
      'url': instance.url,
      'fileSize': instance.fileSize,
    };
