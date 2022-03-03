import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_user_full_info.dart';

part 'v2_tim_friend_info.g.dart';

/// V2TimFriendInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'friendRemark')
  String? friendRemark;

  @JsonKey(name: 'friendGroups')
  List<String>? friendGroups;

  @JsonKey(name: 'friendCustomInfo')
  Map<String, String>? friendCustomInfo;

  @JsonKey(name: 'userProfile')
  V2TimUserFullInfo? userProfile;

  V2TimFriendInfo(
    this.userID,
    this.friendRemark,
    this.friendGroups,
    this.friendCustomInfo,
    this.userProfile,
  );

  factory V2TimFriendInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendInfoToJson(this);
}
