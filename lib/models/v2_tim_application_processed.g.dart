// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_application_processed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimApplicationProcessed _$V2TimApplicationProcessedFromJson(
    Map<String, dynamic> json) {
  return V2TimApplicationProcessed(
    json['groupID'] as String?,
    json['opUser'] == null
        ? null
        : V2TimGroupMemberInfo.fromJson(json['opUser'] as Map<String, dynamic>),
    json['isAgreeJoin'] as bool?,
    json['opReason'] as String?,
  );
}

Map<String, dynamic> _$V2TimApplicationProcessedToJson(
        V2TimApplicationProcessed instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'opUser': instance.opUser,
      'isAgreeJoin': instance.isAgreeJoin,
      'opReason': instance.opReason,
    };
