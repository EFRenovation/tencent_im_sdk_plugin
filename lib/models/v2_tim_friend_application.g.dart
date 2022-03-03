// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendApplication _$V2TimFriendApplicationFromJson(
    Map<String, dynamic> json) {
  return V2TimFriendApplication(
    json['userID'] as String?,
    json['nickname'] as String?,
    json['faceUrl'] as String?,
    json['addTime'] as int?,
    json['addSource'] as String?,
    json['addWording'] as String?,
    json['type'] as int?,
  );
}

Map<String, dynamic> _$V2TimFriendApplicationToJson(
        V2TimFriendApplication instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'nickname': instance.nickname,
      'faceUrl': instance.faceUrl,
      'addTime': instance.addTime,
      'addSource': instance.addSource,
      'addWording': instance.addWording,
      'type': instance.type,
    };
