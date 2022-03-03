// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_signal_fullinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimSignalFullinfo _$V2TimSignalFullinfoFromJson(Map<String, dynamic> json) {
  return V2TimSignalFullinfo(
    json['inviteID'] as String?,
    json['inviter'] as String?,
    json['groupID'] as String?,
    json['invitee'] as String?,
    (json['inviteeList'] as List?)?.map((e) => e as String)?.toList(),
    json['data'] as String?,
  );
}

Map<String, dynamic> _$V2TimSignalFullinfoToJson(
        V2TimSignalFullinfo instance) =>
    <String, dynamic>{
      'inviteID': instance.inviteID,
      'inviter': instance.inviter,
      'groupID': instance.groupID,
      'invitee': instance.invitee,
      'inviteeList': instance.inviteeList,
      'data': instance.data,
    };
