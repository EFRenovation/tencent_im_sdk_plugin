import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_member_full_info.g.dart';

/// V2TimGroupMemberFullInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupMemberFullInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'role')
  int? role;

  @JsonKey(name: 'muteUntil')
  int? muteUntil;

  @JsonKey(name: 'joinTime')
  int? joinTime;

  @JsonKey(name: 'customInfo')
  Map<String, String>? customInfo;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'nameCard')
  String? nameCard;

  @JsonKey(name: 'friendRemark')
  String? friendRemark;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  V2TimGroupMemberFullInfo(
    this.userID,
    this.role,
    this.muteUntil,
    this.joinTime,
    this.customInfo,
    this.nickName,
    this.nameCard,
    this.friendRemark,
    this.faceUrl,
  );

  factory V2TimGroupMemberFullInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupMemberFullInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupMemberFullInfoToJson(this);
}
