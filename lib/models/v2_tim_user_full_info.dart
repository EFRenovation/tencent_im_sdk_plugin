import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_user_full_info.g.dart';

/// V2TimUserFullInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimUserFullInfo extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  @JsonKey(name: 'selfSignature')
  String? selfSignature;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'allowType')
  int? allowType;

  @JsonKey(name: 'customInfo')
  Map<String, String>? customInfo;

  @JsonKey(name: 'role')
  int? role;

  @JsonKey(name: 'level')
  int? level;

  V2TimUserFullInfo(
      this.userID,
      this.nickName,
      this.faceUrl,
      this.selfSignature,
      this.gender,
      this.allowType,
      this.customInfo,
      this.role,
      this.level);

  factory V2TimUserFullInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimUserFullInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimUserFullInfoToJson(this);
}
