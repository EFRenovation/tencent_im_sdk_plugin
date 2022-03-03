// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimConversation _$V2TimConversationFromJson(Map<String, dynamic> json) {
  return V2TimConversation(
    json['conversationID'] as String?,
    json['type'] as int?,
    json['userID'] as String?,
    json['groupID'] as String?,
    json['showName'] as String?,
    json['faceUrl'] as String?,
    json['recvOpt'] as int?,
    json['groupType'] as String?,
    json['unreadCount'] as int?,
    json['lastMessage'] == null
        ? null
        : V2TimMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
    json['draftText'] as String?,
    json['draftTimestamp'] as int?,
    (json['groupAtInfoList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupAtInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimConversationToJson(V2TimConversation instance) =>
    <String, dynamic>{
      'conversationID': instance.conversationID,
      'type': instance.type,
      'userID': instance.userID,
      'groupID': instance.groupID,
      'showName': instance.showName,
      'faceUrl': instance.faceUrl,
      'recvOpt': instance.recvOpt,
      'groupType': instance.groupType,
      'unreadCount': instance.unreadCount,
      'lastMessage': instance.lastMessage,
      'draftText': instance.draftText,
      'draftTimestamp': instance.draftTimestamp,
      'groupAtInfoList': instance.groupAtInfoList,
    };
