import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_change_info.g.dart';

/// V2TimGroupChangeInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupChangeInfo extends Object {
  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'value')
  String? value;

  @JsonKey(name: 'key')
  String? key;

  V2TimGroupChangeInfo(
    this.type,
    this.value,
    this.key,
  );

  factory V2TimGroupChangeInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupChangeInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupChangeInfoToJson(this);
}
