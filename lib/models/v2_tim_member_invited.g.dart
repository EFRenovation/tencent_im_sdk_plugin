// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_member_invited.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMemberInvited _$V2TimMemberInvitedFromJson(Map<String, dynamic> json) {
  return V2TimMemberInvited(
    json['groupID'] as String?,
    json['opUser'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['opUser'] as Map<String, dynamic>),
    (json['memberList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimMemberInvitedToJson(V2TimMemberInvited instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'opUser': instance.opUser,
      'memberList': instance.memberList,
    };
