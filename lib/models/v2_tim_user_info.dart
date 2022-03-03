import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_user_info.g.dart';

/// V2TimUserInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimUserInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  V2TimUserInfo(
    this.userID,
    this.nickName,
    this.faceUrl,
  );

  factory V2TimUserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimUserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimUserInfoToJson(this);
}
