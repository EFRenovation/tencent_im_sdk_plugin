// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_tips_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupTipsElem _$V2TimGroupTipsElemFromJson(Map<String, dynamic> json) {
  return V2TimGroupTipsElem(
    json['groupID'] as String?,
    json['type'] as int?,
    json['opMember'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(
            json['opMember'] as Map<String, dynamic>),
    (json['memberList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['groupChangeInfoList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupChangeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['memberChangeInfoList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberChangeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['memberCount'] as int?,
  );
}

Map<String, dynamic> _$V2TimGroupTipsElemToJson(V2TimGroupTipsElem instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'type': instance.type,
      'opMember': instance.opMember,
      'memberList': instance.memberList,
      'groupChangeInfoList': instance.groupChangeInfoList,
      'memberChangeInfoList': instance.memberChangeInfoList,
      'memberCount': instance.memberCount,
    };
