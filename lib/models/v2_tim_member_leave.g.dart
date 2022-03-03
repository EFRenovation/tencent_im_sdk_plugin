// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_member_leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMemberLeave _$V2TimMemberLeaveFromJson(Map<String, dynamic> json) {
  return V2TimMemberLeave(
    json['groupID'] as String?,
    json['member'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['member'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimMemberLeaveToJson(V2TimMemberLeave instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'member': instance.member,
    };
