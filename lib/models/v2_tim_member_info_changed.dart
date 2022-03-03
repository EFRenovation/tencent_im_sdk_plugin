import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_change_info.dart';

part 'v2_tim_member_info_changed.g.dart';

@JsonSerializable()
class V2TimMemberInfoChanged extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'groupMemberChangeInfoList')
  List<V2TimGroupMemberChangeInfo?>? groupMemberChangeInfoList;

  V2TimMemberInfoChanged(
    this.groupID,
    this.groupMemberChangeInfoList,
  );

  factory V2TimMemberInfoChanged.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMemberInfoChangedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMemberInfoChangedToJson(this);
}
