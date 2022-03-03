// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMessage _$V2TimMessageFromJson(Map<String, dynamic> json) {
  return V2TimMessage(
    json['msgID'] as String?,
    json['timestamp'] as int?,
    json['progress'] as int?,
    json['sender'] as String?,
    json['nickName'] as String?,
    json['friendRemark'] as String?,
    json['faceUrl'] as String?,
    json['nameCard'] as String?,
    json['groupID'] as String?,
    json['userID'] as String?,
    json['status'] as int?,
    json['elemType'] as int?,
    json['textElem'] == null
        ? null
        : V2TimTextElem.fromJson(json['textElem'] as Map<String, dynamic>),
    json['customElem'] == null
        ? null
        : V2TimCustomElem.fromJson(json['customElem'] as Map<String, dynamic>),
    json['imageElem'] == null
        ? null
        : V2TimImageElem.fromJson(json['imageElem'] as Map<String, dynamic>),
    json['soundElem'] == null
        ? null
        : V2TimSoundElem.fromJson(json['soundElem'] as Map<String, dynamic>),
    json['videoElem'] == null
        ? null
        : V2TimVideoElem.fromJson(json['videoElem'] as Map<String, dynamic>),
    json['fileElem'] == null
        ? null
        : V2TimFileElem.fromJson(json['fileElem'] as Map<String, dynamic>),
    json['locationElem'] == null
        ? null
        : V2TimLocationElem.fromJson(
            json['locationElem'] as Map<String, dynamic>),
    json['faceElem'] == null
        ? null
        : V2TimFaceElem.fromJson(json['faceElem'] as Map<String, dynamic>),
    json['groupTipsElem'] == null
        ? null
        : V2TimGroupTipsElem.fromJson(
            json['groupTipsElem'] as Map<String, dynamic>),
    json['localCustomData'] as String?,
    json['localCustomInt'] as int?,
    json['isSelf'] as bool?,
    json['isRead'] as bool?,
    json['isPeerRead'] as bool?,
    json['priority'] as int?,
    json['offlinePushInfo'] == null
        ? null
        : V2TimOfflinePushInfo.fromJson(
            json['offlinePushInfo'] as Map<String, dynamic>),
    (json['groupAtUserList'] as List?)?.map((e) => e as String)?.toList(),
    json['seq'] as int?,
  );
}

Map<String, dynamic> _$V2TimMessageToJson(V2TimMessage instance) =>
    <String, dynamic>{
      'msgID': instance.msgID,
      'timestamp': instance.timestamp,
      'progress': instance.progress,
      'sender': instance.sender,
      'nickName': instance.nickName,
      'friendRemark': instance.friendRemark,
      'faceUrl': instance.faceUrl,
      'nameCard': instance.nameCard,
      'groupID': instance.groupID,
      'userID': instance.userID,
      'status': instance.status,
      'elemType': instance.elemType,
      'textElem': instance.textElem,
      'customElem': instance.customElem,
      'imageElem': instance.imageElem,
      'soundElem': instance.soundElem,
      'videoElem': instance.videoElem,
      'fileElem': instance.fileElem,
      'locationElem': instance.locationElem,
      'faceElem': instance.faceElem,
      'groupTipsElem': instance.groupTipsElem,
      'localCustomData': instance.localCustomData,
      'localCustomInt': instance.localCustomInt,
      'isSelf': instance.isSelf,
      'isRead': instance.isRead,
      'isPeerRead': instance.isPeerRead,
      'priority': instance.priority,
      'offlinePushInfo': instance.offlinePushInfo,
      'groupAtUserList': instance.groupAtUserList,
      'seq': instance.seq,
    };
