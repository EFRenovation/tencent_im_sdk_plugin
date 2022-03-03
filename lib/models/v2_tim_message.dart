import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_custom_elem.dart';
import 'v2_tim_face_elem.dart';
import 'v2_tim_file_elem.dart';
import 'v2_tim_group_tips_elem.dart';
import 'v2_tim_image_elem.dart';
import 'v2_tim_location_elem.dart';
import 'v2_tim_offline_push_info.dart';
import 'v2_tim_sound_elem.dart';
import 'v2_tim_text_elem.dart';
import 'v2_tim_video_elem.dart';

part 'v2_tim_message.g.dart';

/// V2TimMessageReceipt
///
/// {@category Models}
///
@JsonSerializable()
class V2TimMessage extends Object {
  @JsonKey(name: 'msgID')
  String? msgID;

  @JsonKey(name: 'timestamp')
  int? timestamp;

  @JsonKey(name: 'progress')
  int? progress;

  @JsonKey(name: 'sender')
  String? sender;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'friendRemark')
  String? friendRemark;

  @JsonKey(name: 'faceUrl')
  String? faceUrl;

  @JsonKey(name: 'nameCard')
  String? nameCard;

  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'elemType')
  int? elemType;

  @JsonKey(name: 'textElem')
  V2TimTextElem? textElem;

  @JsonKey(name: 'customElem')
  V2TimCustomElem? customElem;

  @JsonKey(name: 'imageElem')
  V2TimImageElem? imageElem;

  @JsonKey(name: 'soundElem')
  V2TimSoundElem? soundElem;

  @JsonKey(name: 'videoElem')
  V2TimVideoElem? videoElem;

  @JsonKey(name: 'fileElem')
  V2TimFileElem? fileElem;

  @JsonKey(name: 'locationElem')
  V2TimLocationElem? locationElem;

  @JsonKey(name: 'faceElem')
  V2TimFaceElem? faceElem;

  @JsonKey(name: 'groupTipsElem')
  V2TimGroupTipsElem? groupTipsElem;

  @JsonKey(name: 'localCustomData')
  String? localCustomData;

  @JsonKey(name: 'localCustomInt')
  int? localCustomInt;

  @JsonKey(name: 'isSelf')
  bool? isSelf;

  @JsonKey(name: 'isRead')
  bool? isRead;

  @JsonKey(name: 'isPeerRead')
  bool? isPeerRead;

  @JsonKey(name: 'priority')
  int? priority;

  @JsonKey(name: 'offlinePushInfo')
  V2TimOfflinePushInfo? offlinePushInfo;

  @JsonKey(name: 'groupAtUserList')
  List<String>? groupAtUserList;

  @JsonKey(name: 'seq')
  int? seq;

  V2TimMessage(
    this.msgID,
    this.timestamp,
    this.progress,
    this.sender,
    this.nickName,
    this.friendRemark,
    this.faceUrl,
    this.nameCard,
    this.groupID,
    this.userID,
    this.status,
    this.elemType,
    this.textElem,
    this.customElem,
    this.imageElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.locationElem,
    this.faceElem,
    this.groupTipsElem,
    this.localCustomData,
    this.localCustomInt,
    this.isSelf,
    this.isRead,
    this.isPeerRead,
    this.priority,
    this.offlinePushInfo,
    this.groupAtUserList,
    this.seq,
  );

  factory V2TimMessage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMessageToJson(this);
}
