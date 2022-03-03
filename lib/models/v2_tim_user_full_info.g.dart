// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_user_full_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimUserFullInfo _$V2TimUserFullInfoFromJson(Map<String, dynamic> json) {
  return V2TimUserFullInfo(
    json['userID'] as String?,
    json['nickName'] as String?,
    json['faceUrl'] as String?,
    json['selfSignature'] as String?,
    json['gender'] as int?,
    json['allowType'] as int?,
    (json['customInfo'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['role'] as int?,
    json['level'] as int?,
  );
}

Map<String, dynamic> _$V2TimUserFullInfoToJson(V2TimUserFullInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'nickName': instance.nickName,
      'faceUrl': instance.faceUrl,
      'selfSignature': instance.selfSignature,
      'gender': instance.gender,
      'allowType': instance.allowType,
      'customInfo': instance.customInfo,
      'role': instance.role,
      'level': instance.level,
    };
