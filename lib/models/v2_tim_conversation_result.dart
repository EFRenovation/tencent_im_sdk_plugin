import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation.dart';

part 'v2_tim_conversation_result.g.dart';

/// V2TimConversationResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimConversationResult extends Object {
  @JsonKey(name: 'nextSeq')
  int? nextSeq;

  @JsonKey(name: 'isFinished')
  bool? isFinished;

  @JsonKey(name: 'conversationList')
  List<V2TimConversation?>? conversationList;

  V2TimConversationResult(
    this.nextSeq,
    this.isFinished,
    this.conversationList,
  );

  factory V2TimConversationResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimConversationResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimConversationResultToJson(this);
}
