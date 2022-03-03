// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_info_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupInfoChanged _$V2TimGroupInfoChangedFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupInfoChanged(
    json['groupID'] as String?,
    (json['groupChangeInfo'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupChangeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimGroupInfoChangedToJson(
        V2TimGroupInfoChanged instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'groupChangeInfo': instance.groupChangeInfo,
    };
