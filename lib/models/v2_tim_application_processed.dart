import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_application_processed.g.dart';

@JsonSerializable()
class V2TimApplicationProcessed extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'opUser')
  V2TimGroupMemberInfo? opUser;

  @JsonKey(name: 'isAgreeJoin')
  bool? isAgreeJoin;

  @JsonKey(name: 'opReason')
  String? opReason;

  V2TimApplicationProcessed(
    this.groupID,
    this.opUser,
    this.isAgreeJoin,
    this.opReason,
  );

  factory V2TimApplicationProcessed.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimApplicationProcessedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimApplicationProcessedToJson(this);
}
