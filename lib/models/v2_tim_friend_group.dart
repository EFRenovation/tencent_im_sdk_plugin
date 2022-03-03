import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_friend_group.g.dart';

/// V2TimFriendGroup
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendGroup extends Object {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'friendCount')
  int? friendCount;

  @JsonKey(name: 'friendIDList')
  List<String>? friendIDList;

  ///@nodoc
  V2TimFriendGroup(
    this.name,
    this.friendCount,
    this.friendIDList,
  );

  ///@nodoc
  factory V2TimFriendGroup.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendGroupFromJson(srcJson);

  ///@nodoc
  Map<String, dynamic> toJson() => _$V2TimFriendGroupToJson(this);
}
