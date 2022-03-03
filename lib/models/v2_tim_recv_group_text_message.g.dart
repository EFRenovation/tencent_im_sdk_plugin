// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_recv_group_text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimRecvGroupTextMessage _$V2TimRecvGroupTextMessageFromJson(
    Map<String, dynamic> json) {
  return V2TimRecvGroupTextMessage(
    json['msgID'] as String?,
    json['sender'] == null
        ? null
        : V2TimUserInfo.fromJson(json['sender'] as Map<String, dynamic>),
    json['groupID'] as String?,
    json['text'] as String?,
  );
}

Map<String, dynamic> _$V2TimRecvGroupTextMessageToJson(
        V2TimRecvGroupTextMessage instance) =>
    <String, dynamic>{
      'msgID': instance.msgID,
      'sender': instance.sender,
      'groupID': instance.groupID,
      'text': instance.text,
    };
