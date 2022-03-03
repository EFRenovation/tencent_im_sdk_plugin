// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupInfo _$V2TimGroupInfoFromJson(Map<String, dynamic> json) {
  return V2TimGroupInfo(
    json['groupID'] as String?,
    json['groupType'] as String?,
    json['groupName'] as String?,
    json['notification'] as String?,
    json['introduction'] as String?,
    json['faceUrl'] as String?,
    json['allMuted'] as bool?,
    json['owner'] as String?,
    json['createTime'] as int?,
    json['groupAddOpt'] as int?,
    json['lastInfoTime'] as int?,
    json['lastMessageTime'] as int?,
    json['memberCount'] as int?,
    json['onlineCount'] as int?,
    json['role'] as int?,
    json['recvOpt'] as int?,
    json['joinTime'] as int?,
    (json['customInfo'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$V2TimGroupInfoToJson(V2TimGroupInfo instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'groupType': instance.groupType,
      'groupName': instance.groupName,
      'notification': instance.notification,
      'introduction': instance.introduction,
      'faceUrl': instance.faceUrl,
      'allMuted': instance.allMuted,
      'owner': instance.owner,
      'createTime': instance.createTime,
      'groupAddOpt': instance.groupAddOpt,
      'lastInfoTime': instance.lastInfoTime,
      'lastMessageTime': instance.lastMessageTime,
      'memberCount': instance.memberCount,
      'onlineCount': instance.onlineCount,
      'role': instance.role,
      'recvOpt': instance.recvOpt,
      'joinTime': instance.joinTime,
      'customInfo': instance.customInfo,
    };
