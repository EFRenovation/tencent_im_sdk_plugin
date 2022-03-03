// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_friend_operation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimFriendOperationResult _$V2TimFriendOperationResultFromJson(
    Map<String, dynamic> json) {
  return V2TimFriendOperationResult(
    json['userID'] as String?,
    json['resultCode'] as int?,
    json['resultInfo'] as String?,
  );
}

Map<String, dynamic> _$V2TimFriendOperationResultToJson(
        V2TimFriendOperationResult instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'resultCode': instance.resultCode,
      'resultInfo': instance.resultInfo,
    };
