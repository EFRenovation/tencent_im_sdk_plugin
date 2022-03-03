// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_image_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimImageElem _$V2TimImageElemFromJson(Map<String, dynamic> json) {
  return V2TimImageElem(
    json['path'] as String?,
    (json['imageList'] as List?)
        ?.map((e) =>
            e == null ? null : V2TimImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimImageElemToJson(V2TimImageElem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'imageList': instance.imageList,
    };
