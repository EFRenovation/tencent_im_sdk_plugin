import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_member.g.dart';

/// V2TimMember
///
/// {@category Models}
///
@JsonSerializable()
class V2TimMember extends Object {
  @JsonKey(name: 'userId')
  String? userId;

  @JsonKey(name: 'role')
  int? role;

  V2TimMember(
    this.userId,
    this.role,
  );

  factory V2TimMember.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMemberFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMemberToJson(this);
}
