import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_friend_application.g.dart';

/// V2TimFriendApplication
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFriendApplication extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  @JsonKey(name: 'addTime')
  int? addTime;

  @JsonKey(name: 'addSource')
  String? addSource;

  @JsonKey(name: 'addWording')
  String? addWording;

  @JsonKey(name: 'type')
  int? type;

  V2TimFriendApplication(
    this.userID,
    this.nickname,
    this.faceUrl,
    this.addTime,
    this.addSource,
    this.addWording,
    this.type,
  );

  factory V2TimFriendApplication.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFriendApplicationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFriendApplicationToJson(this);
}
