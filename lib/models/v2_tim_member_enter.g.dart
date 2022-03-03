// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_member_enter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMemberEnter _$V2TimMemberEnterFromJson(Map<String, dynamic> json) {
  return V2TimMemberEnter(
    json['groupID'] as String?,
    (json['memberList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimMemberEnterToJson(V2TimMemberEnter instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'memberList': instance.memberList,
    };
