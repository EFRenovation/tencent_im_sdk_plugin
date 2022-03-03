import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_face_elem.g.dart';

/// V2TimFaceElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFaceElem extends Object {
  @JsonKey(name: 'index')
  int? index;

  @JsonKey(name: 'data')
  String? data;

  V2TimFaceElem(
    this.index,
    this.data,
  );

  factory V2TimFaceElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFaceElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFaceElemToJson(this);
}
