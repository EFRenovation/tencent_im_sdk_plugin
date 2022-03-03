// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_sdk_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimSdkConfig _$V2TimSdkConfigFromJson(Map<String, dynamic> json) {
  return V2TimSdkConfig(
    json['V2TIM_LOG_NONE'] as int?,
    json['V2TIM_LOG_DEBUG'] as int?,
    json['V2TIM_LOG_INFO'] as int?,
    json['V2TIM_LOG_WARN'] as int?,
    json['V2TIM_LOG_ERROR'] as int?,
  );
}

Map<String, dynamic> _$V2TimSdkConfigToJson(V2TimSdkConfig instance) =>
    <String, dynamic>{
      'V2TIM_LOG_NONE': instance.v2TIMLOGNONE,
      'V2TIM_LOG_DEBUG': instance.v2TIMLOGDEBUG,
      'V2TIM_LOG_INFO': instance.v2TIMLOGINFO,
      'V2TIM_LOG_WARN': instance.v2TIMLOGWARN,
      'V2TIM_LOG_ERROR': instance.v2TIMLOGERROR,
    };
