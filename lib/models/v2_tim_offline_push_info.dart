import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_offline_push_info.g.dart';

/// V2TimOfflinePushInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimOfflinePushInfo extends Object {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'isDisablePush')
  bool? isDisablePush;

  V2TimOfflinePushInfo(
    this.title,
    this.desc,
    this.isDisablePush,
  );

  factory V2TimOfflinePushInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimOfflinePushInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimOfflinePushInfoToJson(this);
}
