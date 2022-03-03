// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_revoke_administrator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimRevokeAdministrator _$V2TimRevokeAdministratorFromJson(
    Map<String, dynamic> json) {
  return V2TimRevokeAdministrator(
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

Map<String, dynamic> _$V2TimRevokeAdministratorToJson(
        V2TimRevokeAdministrator instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'opUser': instance.opUser,
      'memberList': instance.memberList,
    };
