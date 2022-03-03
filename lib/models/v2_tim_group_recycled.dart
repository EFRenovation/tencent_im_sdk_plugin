import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_group_recycled.g.dart';

@JsonSerializable()
class V2TimGroupRecycled extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'opUser')
  V2TimGroupMemberInfo? opUser;

  V2TimGroupRecycled(
    this.groupID,
    this.opUser,
  );

  factory V2TimGroupRecycled.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupRecycledFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupRecycledToJson(this);
}
