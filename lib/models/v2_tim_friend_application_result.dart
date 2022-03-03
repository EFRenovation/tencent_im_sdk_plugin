import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_friend_application.dart';

part 'v2_tim_friend_application_result.g.dart';

/// V2TimFriendApplicationResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendApplicationResult extends Object {
  @JsonKey(name: 'unreadCount')
  int? unreadCount;

  @JsonKey(name: 'friendApplicationList')
  List<V2TimFriendApplication?>? friendApplicationList;

  V2TimFriendApplicationResult(
    this.unreadCount,
    this.friendApplicationList,
  );

  factory V2TimFriendApplicationResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendApplicationResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendApplicationResultToJson(this);
}
