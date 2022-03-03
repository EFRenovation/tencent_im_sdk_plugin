import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_text_elem.g.dart';

/// V2TimTextElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimTextElem extends Object {
  @JsonKey(name: 'text')
  String? text;

  V2TimTextElem(
    this.text,
  );

  factory V2TimTextElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimTextElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimTextElemToJson(this);
}
