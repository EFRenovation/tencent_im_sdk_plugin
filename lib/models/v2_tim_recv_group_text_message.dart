import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_user_info.dart';

part 'v2_tim_recv_group_text_message.g.dart';

/// V2TimRecvGroupTextMessage
///
/// {@category Models}
///
@JsonSerializable()
class V2TimRecvGroupTextMessage extends Object {
  @JsonKey(name: 'msgID')
  String? msgID;

  @JsonKey(name: 'sender')
  V2TimUserInfo? sender;

  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'text')
  String? text;

  V2TimRecvGroupTextMessage(
    this.msgID,
    this.sender,
    this.groupID,
    this.text,
  );

  factory V2TimRecvGroupTextMessage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimRecvGroupTextMessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimRecvGroupTextMessageToJson(this);
}
