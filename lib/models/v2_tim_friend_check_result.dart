import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_friend_check_result.g.dart';

/// V2TimFriendCheckResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendCheckResult extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'resultCode')
  int? resultCode;

  @JsonKey(name: 'resultInfo')
  String? resultInfo;

  @JsonKey(name: 'resultType')
  int? resultType;

  V2TimFriendCheckResult(
    this.userID,
    this.resultCode,
    this.resultInfo,
    this.resultType,
  );

  factory V2TimFriendCheckResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendCheckResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendCheckResultToJson(this);
}
