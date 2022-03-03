import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_receive_join_application.g.dart';

@JsonSerializable()
class V2TimReceiveJoinApplication extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'member')
  V2TimGroupMemberInfo? member;

  @JsonKey(name: 'opReason')
  String? opReason;

  V2TimReceiveJoinApplication(
    this.groupID,
    this.member,
    this.opReason,
  );

  factory V2TimReceiveJoinApplication.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimReceiveJoinApplicationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimReceiveJoinApplicationToJson(this);
}
