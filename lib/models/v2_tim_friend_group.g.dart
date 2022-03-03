// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendGroup _$V2TimFriendGroupFromJson(Map<String, dynamic> json) {
  return V2TimFriendGroup(
    json['name'] as String?,
    json['friendCount'] as int?,
    (json['friendIDList'] as List?)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$V2TimFriendGroupToJson(V2TimFriendGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'friendCount': instance.friendCount,
      'friendIDList': instance.friendIDList,
    };
