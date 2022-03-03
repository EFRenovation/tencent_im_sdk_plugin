// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimMember _$V2TimMemberFromJson(Map<String, dynamic> json) {
  return V2TimMember(
    json['userId'] as String?,
    json['role'] as int?,
  );
}

Map<String, dynamic> _$V2TimMemberToJson(V2TimMember instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
    };
