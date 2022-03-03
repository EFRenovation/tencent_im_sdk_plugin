import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_application.g.dart';

/// V2TimGroupApplication
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupApplication extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'fromUser')
  String? fromUser;

  @JsonKey(name: 'fromUserNickName')
  String? fromUserNickName;

  @JsonKey(name: 'fromUserFaceUrl')
  String? fromUserFaceUrl;

  @JsonKey(name: 'toUser')
  String? toUser;

  @JsonKey(name: 'addTime')
  int? addTime;

  @JsonKey(name: 'requestMsg')
  String? requestMsg;

  @JsonKey(name: 'handledMsg')
  String? handledMsg;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'handleStatus')
  int? handleStatus;

  @JsonKey(name: 'handleResult')
  int? handleResult;

  V2TimGroupApplication(
    this.groupID,
    this.fromUser,
    this.fromUserNickName,
    this.fromUserFaceUrl,
    this.toUser,
    this.addTime,
    this.requestMsg,
    this.handledMsg,
    this.type,
    this.handleStatus,
    this.handleResult,
  );

  factory V2TimGroupApplication.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupApplicationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupApplicationToJson(this);
}
