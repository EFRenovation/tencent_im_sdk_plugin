import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_group_dismissed.g.dart';

@JsonSerializable()
class V2TimGroupDismissed extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'opUser')
  V2TimGroupMemberInfo? opUser;

  V2TimGroupDismissed(
    this.groupID,
    this.opUser,
  );

  factory V2TimGroupDismissed.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupDismissedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupDismissedToJson(this);
}
