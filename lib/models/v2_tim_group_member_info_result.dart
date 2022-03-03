import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_group_member_full_info.dart';

part 'v2_tim_group_member_info_result.g.dart';

/// V2TimGroupMemberInfoResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupMemberInfoResult extends Object {
  @JsonKey(name: 'nextSeq')
  int? nextSeq;

  @JsonKey(name: 'memberInfoList')
  List<V2TimGroupMemberFullInfo?>? memberInfoList;

  V2TimGroupMemberInfoResult(
    this.nextSeq,
    this.memberInfoList,
  );

  factory V2TimGroupMemberInfoResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupMemberInfoResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupMemberInfoResultToJson(this);
}
