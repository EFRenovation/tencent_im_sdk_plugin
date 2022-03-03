import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_sdk_config.g.dart';

/// V2TimSdkConfig
///
/// {@category Models}
///
@JsonSerializable()
class V2TimSdkConfig extends Object {
  @JsonKey(name: 'V2TIM_LOG_NONE')
  int? v2TIMLOGNONE;

  @JsonKey(name: 'V2TIM_LOG_DEBUG')
  int? v2TIMLOGDEBUG;

  @JsonKey(name: 'V2TIM_LOG_INFO')
  int? v2TIMLOGINFO;

  @JsonKey(name: 'V2TIM_LOG_WARN')
  int? v2TIMLOGWARN;

  @JsonKey(name: 'V2TIM_LOG_ERROR')
  int? v2TIMLOGERROR;

  V2TimSdkConfig(
    this.v2TIMLOGNONE,
    this.v2TIMLOGDEBUG,
    this.v2TIMLOGINFO,
    this.v2TIMLOGWARN,
    this.v2TIMLOGERROR,
  );

  factory V2TimSdkConfig.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimSdkConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimSdkConfigToJson(this);
}
