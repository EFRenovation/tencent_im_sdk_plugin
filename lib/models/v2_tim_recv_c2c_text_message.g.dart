// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_recv_c2c_text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimRecvC2cTextMessage _$V2TimRecvC2cTextMessageFromJson(
    Map<String, dynamic> json) {
  return V2TimRecvC2cTextMessage(
    json['msgID'] as String?,
    json['sender'] == null
        ? null
        : V2TimUserInfo.fromJson(json['sender'] as Map<String, dynamic>),
    json['text'] as String?,
  );
}

Map<String, dynamic> _$V2TimRecvC2cTextMessageToJson(
        V2TimRecvC2cTextMessage instance) =>
    <String, dynamic>{
      'msgID': instance.msgID,
      'sender': instance.sender,
      'text': instance.text,
    };
