import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_user_info.dart';

part 'v2_tim_recv_group_custom_message.g.dart';

/// V2TimRecvGroupCustomMessage
///
/// {@category Models}
///
@JsonSerializable()
class V2TimRecvGroupCustomMessage extends Object {
  @JsonKey(name: 'msgID')
  String? msgID;

  @JsonKey(name: 'sender')
  V2TimUserInfo? sender;

  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'customData')
  String? customData;

  V2TimRecvGroupCustomMessage(
    this.msgID,
    this.sender,
    this.groupID,
    this.customData,
  );

  factory V2TimRecvGroupCustomMessage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimRecvGroupCustomMessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimRecvGroupCustomMessageToJson(this);
}
