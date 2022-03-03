// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendInfo _$V2TimFriendInfoFromJson(Map<String, dynamic> json) {
  return V2TimFriendInfo(
    json['userID'] as String?,
    json['friendRemark'] as String?,
    (json['friendGroups'] as List?)?.map((e) => e as String)?.toList(),
    (json['friendCustomInfo'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['userProfile'] == null
        ? null
        : V2TimUserFullInfo.fromJson(
            json['userProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimFriendInfoToJson(V2TimFriendInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'friendRemark': instance.friendRemark,
      'friendGroups': instance.friendGroups,
      'friendCustomInfo': instance.friendCustomInfo,
      'userProfile': instance.userProfile,
    };
