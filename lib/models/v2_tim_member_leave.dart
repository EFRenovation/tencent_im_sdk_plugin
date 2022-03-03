import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_member_leave.g.dart';

@JsonSerializable()
class V2TimMemberLeave extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'member')
  V2TimGroupMemberInfo? member;

  V2TimMemberLeave(
    this.groupID,
    this.member,
  );

  factory V2TimMemberLeave.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMemberLeaveFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMemberLeaveToJson(this);
}
