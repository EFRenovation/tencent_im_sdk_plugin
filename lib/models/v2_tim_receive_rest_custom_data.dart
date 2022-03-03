import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_receive_rest_custom_data.g.dart';

@JsonSerializable()
class V2TimReceiveRestCustomData extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'customData')
  String? customData;

  V2TimReceiveRestCustomData(
    this.groupID,
    this.customData,
  );

  factory V2TimReceiveRestCustomData.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimReceiveRestCustomDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimReceiveRestCustomDataToJson(this);
}
