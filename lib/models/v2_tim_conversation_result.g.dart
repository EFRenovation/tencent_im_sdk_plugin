// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_conversation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimConversationResult _$V2TimConversationResultFromJson(
    Map<String, dynamic> json) {
  return V2TimConversationResult(
    json['nextSeq'] as int?,
    json['isFinished'] as bool?,
    (json['conversationList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimConversation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimConversationResultToJson(
        V2TimConversationResult instance) =>
    <String, dynamic>{
      'nextSeq': instance.nextSeq,
      'isFinished': instance.isFinished,
      'conversationList': instance.conversationList,
    };
