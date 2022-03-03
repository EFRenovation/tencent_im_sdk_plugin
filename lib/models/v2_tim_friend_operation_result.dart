import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_friend_operation_result.g.dart';

/// V2TimFriendOperationResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendOperationResult extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'resultCode')
  int? resultCode;

  @JsonKey(name: 'resultInfo')
  String? resultInfo;

  V2TimFriendOperationResult(
    this.userID,
    this.resultCode,
    this.resultInfo,
  );

  factory V2TimFriendOperationResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendOperationResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendOperationResultToJson(this);
}
