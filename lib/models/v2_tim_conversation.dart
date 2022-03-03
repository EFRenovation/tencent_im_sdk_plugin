import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';

import 'v2_tim_group_at_info.dart';

part 'v2_tim_conversation.g.dart';

/// V2TimConversation
///
/// {@category Models}
///
@JsonSerializable()
class V2TimConversation extends Object {
  @JsonKey(name: 'conversationID')
  String? conversationID;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'showName')
  String? showName;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  @JsonKey(name: 'recvOpt')
  int? recvOpt;

  @JsonKey(name: 'groupType')
  String? groupType;

  @JsonKey(name: 'unreadCount')
  int? unreadCount;

  @JsonKey(name: 'lastMessage')
  V2TimMessage? lastMessage;

  @JsonKey(name: 'draftText')
  String? draftText;

  @JsonKey(name: 'draftTimestamp')
  int? draftTimestamp;

  @JsonKey(name: 'groupAtInfoList')
  List<V2TimGroupAtInfo?>? groupAtInfoList;

  V2TimConversation(
    this.conversationID,
    this.type,
    this.userID,
    this.groupID,
    this.showName,
    this.faceUrl,
    this.recvOpt,
    this.groupType,
    this.unreadCount,
    this.lastMessage,
    this.draftText,
    this.draftTimestamp,
    this.groupAtInfoList,
  );

  factory V2TimConversation.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimConversationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimConversationToJson(this);
}
