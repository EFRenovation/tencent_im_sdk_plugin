import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';

part 'v2_tim_grant_administrator.g.dart';

@JsonSerializable()
class V2TimGrantAdministrator extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'opUser')
  V2TimGroupMemberInfo? opUser;

  @JsonKey(name: 'memberList')
  List<V2TimGroupMemberInfo?>? memberList;

  V2TimGrantAdministrator(
    this.groupID,
    this.opUser,
    this.memberList,
  );

  factory V2TimGrantAdministrator.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGrantAdministratorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGrantAdministratorToJson(this);
}
