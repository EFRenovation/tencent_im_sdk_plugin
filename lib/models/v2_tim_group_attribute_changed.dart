import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_attribute_changed.g.dart';

@JsonSerializable()
class V2TimGroupAttributeChanged extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'groupAttributeMap')
  Map<String, String>? groupAttributeMap;

  V2TimGroupAttributeChanged(
    this.groupID,
    this.groupAttributeMap,
  );

  factory V2TimGroupAttributeChanged.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupAttributeChangedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupAttributeChangedToJson(this);
}
