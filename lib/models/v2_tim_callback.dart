import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_callback.g.dart';

/// V2TimCallback
///
/// {@category Models}
///
@JsonSerializable()
class V2TimCallback extends Object {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'desc')
  String? desc;

  V2TimCallback(
    this.code,
    this.desc,
  );

  factory V2TimCallback.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimCallbackFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimCallbackToJson(this);
}
