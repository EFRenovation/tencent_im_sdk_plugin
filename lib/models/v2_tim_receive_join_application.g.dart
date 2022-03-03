// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_receive_join_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimReceiveJoinApplication _$V2TimReceiveJoinApplicationFromJson(
    Map<String, dynamic> json) {
  return V2TimReceiveJoinApplication(
    json['groupID'] as String?,
    json['member'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['member'] as Map<String, dynamic>),
    json['opReason'] as String?,
  );
}

Map<String, dynamic> _$V2TimReceiveJoinApplicationToJson(
        V2TimReceiveJoinApplication instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'member': instance.member,
      'opReason': instance.opReason,
    };
