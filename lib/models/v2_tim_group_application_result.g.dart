// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_application_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupApplicationResult _$V2TimGroupApplicationResultFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupApplicationResult(
    json['unreadCount'] as int?,
    (json['groupApplicationList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupApplication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimGroupApplicationResultToJson(
        V2TimGroupApplicationResult instance) =>
    <String, dynamic>{
      'unreadCount': instance.unreadCount,
      'groupApplicationList': instance.groupApplicationList,
    };
