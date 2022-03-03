// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimUserInfo _$V2TimUserInfoFromJson(Map<String, dynamic> json) {
  return V2TimUserInfo(
    json['userID'] as String?,
    json['nickName'] as String?,
    json['faceUrl'] as String?,
  );
}

Map<String, dynamic> _$V2TimUserInfoToJson(V2TimUserInfo instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'nickName': instance.nickName,
      'faceUrl': instance.faceUrl,
    };
