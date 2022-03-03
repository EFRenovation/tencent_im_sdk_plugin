import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_member_change_info.g.dart';

/// V2TIMGroupMemberChangeInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupMemberChangeInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'muteTime')
  int? muteTime;

  V2TimGroupMemberChangeInfo(
    this.userID,
    this.muteTime,
  );

  factory V2TimGroupMemberChangeInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupMemberChangeInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupMemberChangeInfoToJson(this);
}
