import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_member_info.g.dart';

/// V2TimGroupMemberInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupMemberInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'nameCard')
  String? nameCard;

  @JsonKey(name: 'friendRemark')
  String? friendRemark;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  V2TimGroupMemberInfo(
    this.userID,
    this.nickName,
    this.nameCard,
    this.friendRemark,
    this.faceUrl,
  );

  factory V2TimGroupMemberInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupMemberInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupMemberInfoToJson(this);
}
