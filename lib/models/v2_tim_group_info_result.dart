import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info.dart';

part 'v2_tim_group_info_result.g.dart';

/// V2TimGroupInfoResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupInfoResult extends Object {
  @JsonKey(name: 'resultCode')
  int? resultCode;

  @JsonKey(name: 'resultMessage')
  String? resultMessage;

  @JsonKey(name: 'groupInfo')
  V2TimGroupInfo? groupInfo;

  V2TimGroupInfoResult(
    this.resultCode,
    this.resultMessage,
    this.groupInfo,
  );

  factory V2TimGroupInfoResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupInfoResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupInfoResultToJson(this);
}
