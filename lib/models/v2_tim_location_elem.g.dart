// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_location_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimLocationElem _$V2TimLocationElemFromJson(Map<String, dynamic> json) {
  return V2TimLocationElem(
    json['desc'] as String?,
    (json['longitude'] as num?)?.toDouble(),
    (json['latitude'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$V2TimLocationElemToJson(V2TimLocationElem instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
