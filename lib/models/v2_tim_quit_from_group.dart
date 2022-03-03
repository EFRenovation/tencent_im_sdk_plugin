import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_quit_from_group.g.dart';

@JsonSerializable()
class V2TimQuitFromGroup extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  V2TimQuitFromGroup(
    this.groupID,
  );

  factory V2TimQuitFromGroup.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimQuitFromGroupFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimQuitFromGroupToJson(this);
}
