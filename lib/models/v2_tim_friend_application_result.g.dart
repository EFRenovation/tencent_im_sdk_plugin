// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_application_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendApplicationResult _$V2TimFriendApplicationResultFromJson(
    Map<String, dynamic> json) {
  return V2TimFriendApplicationResult(
    json['unreadCount'] as int?,
    (json['friendApplicationList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimFriendApplication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimFriendApplicationResultToJson(
        V2TimFriendApplicationResult instance) =>
    <String, dynamic>{
      'unreadCount': instance.unreadCount,
      'friendApplicationList': instance.friendApplicationList,
    };
