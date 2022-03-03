// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_recycled.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupRecycled _$V2TimGroupRecycledFromJson(Map<String, dynamic> json) {
  return V2TimGroupRecycled(
    json['groupID'] as String?,
    json['opUser'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['opUser'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimGroupRecycledToJson(V2TimGroupRecycled instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'opUser': instance.opUser,
    };
