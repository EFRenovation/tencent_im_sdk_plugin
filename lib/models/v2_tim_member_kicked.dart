import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_member_kicked.g.dart';

@JsonSerializable()
class V2TimMemberKicked extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'opUser')
  V2TimGroupMemberInfo? opUser;

  @JsonKey(name: 'memberList')
  List<V2TimGroupMemberInfo?>? memberList;

  V2TimMemberKicked(
    this.groupID,
    this.opUser,
    this.memberList,
  );

  factory V2TimMemberKicked.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMemberKickedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMemberKickedToJson(this);
}
