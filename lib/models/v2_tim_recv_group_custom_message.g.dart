// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_recv_group_custom_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimRecvGroupCustomMessage _$V2TimRecvGroupCustomMessageFromJson(
    Map<String, dynamic> json) {
  return V2TimRecvGroupCustomMessage(
    json['msgID'] as String?,
    json['sender'] == null
        ? null
        : V2TimUserInfo.fromJson(json['sender'] as Map<String, dynamic>),
    json['groupID'] as String?,
    json['customData'] as String?,
  );
}

Map<String, dynamic> _$V2TimRecvGroupCustomMessageToJson(
        V2TimRecvGroupCustomMessage instance) =>
    <String, dynamic>{
      'msgID': instance.msgID,
      'sender': instance.sender,
      'groupID': instance.groupID,
      'customData': instance.customData,
    };
