import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_at_info.g.dart';

/// V2TimGroupAtInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupAtInfo extends Object {
  @JsonKey(name: 'seq')
  int? seq;

  @JsonKey(name: 'atType')
  int? atType;

  V2TimGroupAtInfo(
    this.seq,
    this.atType,
  );

  factory V2TimGroupAtInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupAtInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupAtInfoToJson(this);
}
