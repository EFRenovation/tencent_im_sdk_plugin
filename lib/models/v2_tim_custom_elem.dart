import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_custom_elem.g.dart';

/// V2TimCustomElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimCustomElem extends Object {
  @JsonKey(name: 'data')
  String? data;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'extension')
  String? extension;

  V2TimCustomElem(
    this.data,
    this.desc,
    this.extension
  );

  factory V2TimCustomElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimCustomElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimCustomElemToJson(this);
}
