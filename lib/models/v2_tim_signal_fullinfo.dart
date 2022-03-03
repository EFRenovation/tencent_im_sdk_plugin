import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_signal_fullinfo.g.dart';

@JsonSerializable()
class V2TimSignalFullinfo extends Object {
  @JsonKey(name: 'inviteID')
  String? inviteID;

  @JsonKey(name: 'inviter')
  String? inviter;

  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'invitee')
  String? invitee;

  @JsonKey(name: 'inviteeList')
  List<String>? inviteeList;

  @JsonKey(name: 'data')
  String? data;

  V2TimSignalFullinfo(
    this.inviteID,
    this.inviter,
    this.groupID,
    this.invitee,
    this.inviteeList,
    this.data,
  );

  factory V2TimSignalFullinfo.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimSignalFullinfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimSignalFullinfoToJson(this);
}
