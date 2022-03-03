// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_member_info_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMemberInfoChanged _$V2TimMemberInfoChangedFromJson(
    Map<String, dynamic> json) {
  return V2TimMemberInfoChanged(
    json['groupID'] as String?,
    (json['groupMemberChangeInfoList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberChangeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimMemberInfoChangedToJson(
        V2TimMemberInfoChanged instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'groupMemberChangeInfoList': instance.groupMemberChangeInfoList,
    };
