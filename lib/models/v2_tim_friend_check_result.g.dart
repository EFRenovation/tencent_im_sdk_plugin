// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_check_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendCheckResult _$V2TimFriendCheckResultFromJson(
    Map<String, dynamic> json) {
  return V2TimFriendCheckResult(
    json['userID'] as String?,
    json['resultCode'] as int?,
    json['resultInfo'] as String?,
    json['resultType'] as int?,
  );
}

Map<String, dynamic> _$V2TimFriendCheckResultToJson(
        V2TimFriendCheckResult instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'resultCode': instance.resultCode,
      'resultInfo': instance.resultInfo,
      'resultType': instance.resultType,
    };
