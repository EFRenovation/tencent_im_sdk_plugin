// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_message_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMessageReceipt _$V2TimMessageReceiptFromJson(Map<String, dynamic> json) {
  return V2TimMessageReceipt(
    json['userID'] as String?,
    json['timestamp'] as int?,
  );
}

Map<String, dynamic> _$V2TimMessageReceiptToJson(
        V2TimMessageReceipt instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'timestamp': instance.timestamp,
    };
