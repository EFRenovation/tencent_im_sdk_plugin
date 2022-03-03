import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_group_application.dart';

part 'v2_tim_group_application_result.g.dart';

/// V2TimGroupApplicationResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupApplicationResult extends Object {
  @JsonKey(name: 'unreadCount')
  int? unreadCount;

  @JsonKey(name: 'groupApplicationList')
  List<V2TimGroupApplication?>? groupApplicationList;

  V2TimGroupApplicationResult(
    this.unreadCount,
    this.groupApplicationList,
  );

  factory V2TimGroupApplicationResult.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimGroupApplicationResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimGroupApplicationResultToJson(this);
}
