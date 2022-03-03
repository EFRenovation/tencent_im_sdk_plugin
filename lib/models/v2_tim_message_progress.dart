import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';

part 'v2_tim_message_progress.g.dart';

@JsonSerializable()
class MessageProgress extends Object {
  @JsonKey(name: 'message')
  V2TimMessage? message;

  @JsonKey(name: 'progress')
  int? progress;

  MessageProgress(
    this.message,
    this.progress,
  );

  factory MessageProgress.fromJson(Map<String, dynamic> srcJson) =>
      _$MessageProgressFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageProgressToJson(this);
}
