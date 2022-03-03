import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_info.g.dart';

/// V2TimGroupInfo
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupInfo extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'groupType')
  String? groupType;

  @JsonKey(name: 'groupName')
  String? groupName;

  @JsonKey(name: 'notification')
  String? notification;

  @JsonKey(name: 'introduction')
  String? introduction;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  @JsonKey(name: 'allMuted')
  bool? allMuted;

  @JsonKey(name: 'owner')
  String? owner;

  @JsonKey(name: 'createTime')
  int? createTime;

  @JsonKey(name: 'groupAddOpt')
  int? groupAddOpt;

  @JsonKey(name: 'lastInfoTime')
  int? lastInfoTime;

  @JsonKey(name: 'lastMessageTime')
  int? lastMessageTime;

  @JsonKey(name: 'memberCount')
  int? memberCount;

  @JsonKey(name: 'onlineCount')
  int? onlineCount;

  @JsonKey(name: 'role')
  int? role;

  @JsonKey(name: 'recvOpt')
  int? recvOpt;

  @JsonKey(name: 'joinTime')
  int? joinTime;

  @JsonKey(name: 'customInfo')
  Map<String, String>? customInfo;

  V2TimGroupInfo(
      this.groupID,
      this.groupType,
      this.groupName,
      this.notification,
      this.introduction,
      this.faceUrl,
      this.allMuted,
      this.owner,
      this.createTime,
      this.groupAddOpt,
      this.lastInfoTime,
      this.lastMessageTime,
      this.memberCount,
      this.onlineCount,
      this.role,
      this.recvOpt,
      this.joinTime,
      this.customInfo);

  factory V2TimGroupInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupInfoToJson(this);
}
