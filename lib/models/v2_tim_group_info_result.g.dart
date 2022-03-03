// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_info_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupInfoResult _$V2TimGroupInfoResultFromJson(Map<String, dynamic> json) {
  return V2TimGroupInfoResult(
    json['resultCode'] as int?,
    json['resultMessage'] as String?,
    json['groupInfo'] == null
        ? null
        : V2TimGroupInfo.fromJson(json['groupInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimGroupInfoResultToJson(
        V2TimGroupInfoResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
      'groupInfo': instance.groupInfo,
    };
