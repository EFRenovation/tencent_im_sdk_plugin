// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_message_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageProgress _$MessageProgressFromJson(Map<String, dynamic> json) {
  return MessageProgress(
    json['message'] == null
        ? null
        : V2TimMessage.fromJson(json['message'] as Map<String, dynamic>),
    json['progress'] as int?,
  );
}

Map<String, dynamic> _$MessageProgressToJson(MessageProgress instance) =>
    <String, dynamic>{
      'message': instance.message,
      'progress': instance.progress,
    };
