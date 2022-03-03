// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_member_full_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupMemberFullInfo _$V2TimGroupMemberFullInfoFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupMemberFullInfo(
    json['userID'] as String?,
    json['role'] as int?,
    json['muteUntil'] as int?,
    json['joinTime'] as int?,
    (json['customInfo'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['nickName'] as String?,
    json['nameCard'] as String?,
    json['friendRemark'] as String?,
    json['faceUrl'] as String?,
  );
}

Map<String, dynamic> _$V2TimGroupMemberFullInfoToJson(
        V2TimGroupMemberFullInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'role': instance.role,
      'muteUntil': instance.muteUntil,
      'joinTime': instance.joinTime,
      'customInfo': instance.customInfo,
      'nickName': instance.nickName,
      'nameCard': instance.nameCard,
      'friendRemark': instance.friendRemark,
      'faceUrl': instance.faceUrl,
    };
