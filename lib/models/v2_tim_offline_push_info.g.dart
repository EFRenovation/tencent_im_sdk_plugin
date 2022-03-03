// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_offline_push_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimOfflinePushInfo _$V2TimOfflinePushInfoFromJson(Map<String, dynamic> json) {
  return V2TimOfflinePushInfo(
    json['title'] as String?,
    json['desc'] as String?,
    json['isDisablePush'] as bool?,
  );
}

Map<String, dynamic> _$V2TimOfflinePushInfoToJson(
        V2TimOfflinePushInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'isDisablePush': instance.isDisablePush,
    };
