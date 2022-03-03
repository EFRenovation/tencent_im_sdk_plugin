// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_recv_c2c_custom_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimRecvC2cCustomMessage _$V2TimRecvC2cCustomMessageFromJson(
    Map<String, dynamic> json) {
  return V2TimRecvC2cCustomMessage(
    json['msgID'] as String?,
    json['sender'] == null
        ? null
        : V2TimUserInfo.fromJson(json['sender'] as Map<String, dynamic>),
    json['customData'] as String?,
  );
}

Map<String, dynamic> _$V2TimRecvC2cCustomMessageToJson(
        V2TimRecvC2cCustomMessage instance) =>
    <String, dynamic>{
      'msgID': instance.msgID,
      'sender': instance.sender,
      'customData': instance.customData,
    };
