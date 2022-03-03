// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_member_change_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupMemberChangeInfo _$V2TimGroupMemberChangeInfoFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupMemberChangeInfo(
    json['userID'] as String?,
    json['muteTime'] as int?,
  );
}

Map<String, dynamic> _$V2TimGroupMemberChangeInfoToJson(
        V2TimGroupMemberChangeInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'muteTime': instance.muteTime,
    };
