// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_info_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendInfoResult _$V2TimFriendInfoResultFromJson(
    Map<String, dynamic> json) {
  return V2TimFriendInfoResult(
    json['resultCode'] as int?,
    json['resultInfo'] as String?,
    json['relation'] as int?,
    json['friendInfo'] == null
        ? null
        : V2TimFriendInfo.fromJson(json['friendInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimFriendInfoResultToJson(
        V2TimFriendInfoResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultInfo': instance.resultInfo,
      'relation': instance.relation,
      'friendInfo': instance.friendInfo,
    };
