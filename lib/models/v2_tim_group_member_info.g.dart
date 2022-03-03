// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_member_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupMemberInfo _$V2TimGroupMemberInfoFromJson(Map<String, dynamic> json) {
  return V2TimGroupMemberInfo(
    json['userID'] as String?,
    json['nickName'] as String?,
    json['nameCard'] as String?,
    json['friendRemark'] as String?,
    json['faceUrl'] as String?,
  );
}

Map<String, dynamic> _$V2TimGroupMemberInfoToJson(
        V2TimGroupMemberInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'nickName': instance.nickName,
      'nameCard': instance.nameCard,
      'friendRemark': instance.friendRemark,
      'faceUrl': instance.faceUrl,
    };
