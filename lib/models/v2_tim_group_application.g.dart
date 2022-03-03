// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupApplication _$V2TimGroupApplicationFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupApplication(
    json['groupID'] as String?,
    json['fromUser'] as String?,
    json['fromUserNickName'] as String?,
    json['fromUserFaceUrl'] as String?,
    json['toUser'] as String?,
    json['addTime'] as int?,
    json['requestMsg'] as String?,
    json['handledMsg'] as String?,
    json['type'] as int?,
    json['handleStatus'] as int?,
    json['handleResult'] as int?,
  );
}

Map<String, dynamic> _$V2TimGroupApplicationToJson(
        V2TimGroupApplication instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'fromUser': instance.fromUser,
      'fromUserNickName': instance.fromUserNickName,
      'fromUserFaceUrl': instance.fromUserFaceUrl,
      'toUser': instance.toUser,
      'addTime': instance.addTime,
      'requestMsg': instance.requestMsg,
      'handledMsg': instance.handledMsg,
      'type': instance.type,
      'handleStatus': instance.handleStatus,
      'handleResult': instance.handleResult,
    };
