// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_dismissed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupDismissed _$V2TimGroupDismissedFromJson(Map<String, dynamic> json) {
  return V2TimGroupDismissed(
    json['groupID'] as String?,
    json['opUser'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['opUser'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$V2TimGroupDismissedToJson(
        V2TimGroupDismissed instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'opUser': instance.opUser,
    };
