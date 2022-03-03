import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_group_change_info.dart';
import 'v2_tim_group_member_change_info.dart';
import 'v2_tim_group_member_info.dart';

part 'v2_tim_group_tips_elem.g.dart';

/// V2TimGroupTipsElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupTipsElem extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'opMember')
  V2TimGroupMemberInfo? opMember;

  @JsonKey(name: 'memberList')
  List<V2TimGroupMemberInfo?>? memberList;

  @JsonKey(name: 'groupChangeInfoList')
  List<V2TimGroupChangeInfo?>? groupChangeInfoList;

  @JsonKey(name: 'memberChangeInfoList')
  List<V2TimGroupMemberChangeInfo?>? memberChangeInfoList;

  @JsonKey(name: 'memberCount')
  int? memberCount;

  V2TimGroupTipsElem(
    this.groupID,
    this.type,
    this.opMember,
    this.memberList,
    this.groupChangeInfoList,
    this.memberChangeInfoList,
    this.memberCount,
  );

  factory V2TimGroupTipsElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupTipsElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupTipsElemToJson(this);
}
