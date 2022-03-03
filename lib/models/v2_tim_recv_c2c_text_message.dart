import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_user_info.dart';

part 'v2_tim_recv_c2c_text_message.g.dart';

/// V2TimRecvC2cTextMessage
///
/// {@category Models}
///
@JsonSerializable()
class V2TimRecvC2cTextMessage extends Object {
  @JsonKey(name: 'msgID')
  String? msgID;

  @JsonKey(name: 'sender')
  V2TimUserInfo? sender;

  @JsonKey(name: 'text')
  String? text;

  V2TimRecvC2cTextMessage(
    this.msgID,
    this.sender,
    this.text,
  );

  factory V2TimRecvC2cTextMessage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimRecvC2cTextMessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimRecvC2cTextMessageToJson(this);
}
