import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info.dart';

part 'v2_tim_friend_info_result.g.dart';

/// V2TimFriendInfoResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendInfoResult extends Object {
  @JsonKey(name: 'resultCode')
  int? resultCode;

  @JsonKey(name: 'resultInfo')
  String? resultInfo;

  @JsonKey(name: 'relation')
  int? relation;

  @JsonKey(name: 'friendInfo')
  V2TimFriendInfo? friendInfo;

  V2TimFriendInfoResult(
    this.resultCode,
    this.resultInfo,
    this.relation,
    this.friendInfo,
  );

  factory V2TimFriendInfoResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendInfoResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendInfoResultToJson(this);
}
