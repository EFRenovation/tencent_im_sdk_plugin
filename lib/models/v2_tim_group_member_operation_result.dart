import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_group_member_operation_result.g.dart';

/// V2TimGroupMemberOperationResult
///
/// {@category Models}
///
@JsonSerializable()
class V2TimGroupMemberOperationResult extends Object {
  @JsonKey(name: 'memberID')
  String? memberID;

  @JsonKey(name: 'result')
  int? result;

  V2TimGroupMemberOperationResult(
    this.memberID,
    this.result,
  );

  factory V2TimGroupMemberOperationResult.fromJson(
          Map<String, dynamic> srcJson) =>
      _$V2TimGroupMemberOperationResultFromJson(srcJson);

  Map<String, dynamic> toJson() =>
      _$V2TimGroupMemberOperationResultToJson(this);
}
