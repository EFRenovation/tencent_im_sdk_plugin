import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_member_enter.g.dart';

@JsonSerializable()
class V2TimMemberEnter extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'memberList')
  List<V2TimGroupMemberInfo?>? memberList;

  V2TimMemberEnter(
    this.groupID,
    this.memberList,
  );

  factory V2TimMemberEnter.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMemberEnterFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMemberEnterToJson(this);
}
