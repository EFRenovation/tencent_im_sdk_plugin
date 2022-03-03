// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_member_info_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupMemberInfoResult _$V2TimGroupMemberInfoResultFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupMemberInfoResult(
    json['nextSeq'] as int?,
    (json['memberInfoList'] as List?)
        ?.map((e) => e == null
            ? null
            : V2TimGroupMemberFullInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$V2TimGroupMemberInfoResultToJson(
        V2TimGroupMemberInfoResult instance) =>
    <String, dynamic>{
      'nextSeq': instance.nextSeq,
      'memberInfoList': instance.memberInfoList,
    };
