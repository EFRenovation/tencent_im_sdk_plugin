import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_user_info.dart';

part 'v2_tim_recv_c2c_custom_message.g.dart';

/// V2TimRecvC2cCustomMessage
///
/// {@category Models}
///
@JsonSerializable()
class V2TimRecvC2cCustomMessage extends Object {
  @JsonKey(name: 'msgID')
  String? msgID;

  @JsonKey(name: 'sender')
  V2TimUserInfo? sender;

  @JsonKey(name: 'customData')
  String? customData;

  V2TimRecvC2cCustomMessage(
    this.msgID,
    this.sender,
    this.customData,
  );

  factory V2TimRecvC2cCustomMessage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimRecvC2cCustomMessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimRecvC2cCustomMessageToJson(this);
}
