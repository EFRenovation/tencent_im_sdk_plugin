import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_change_info.dart';

part 'v2_tim_group_info_changed.g.dart';

@JsonSerializable()
class V2TimGroupInfoChanged extends Object {
  @JsonKey(name: 'groupID')
  String? groupID;

  @JsonKey(name: 'groupChangeInfo')
  List<V2TimGroupChangeInfo?>? groupChangeInfo;

  V2TimGroupInfoChanged(
    this.groupID,
    this.groupChangeInfo,
  );

  factory V2TimGroupInfoChanged.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupInfoChangedFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupInfoChangedToJson(this);
}
