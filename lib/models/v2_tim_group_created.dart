import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_created.g.dart';

@JsonSerializable()
class V2TimGroupCreated extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  V2TimGroupCreated(
    this.groupID,
  );

  factory V2TimGroupCreated.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupCreatedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupCreatedToJson(this);
}
