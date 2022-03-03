import 'package:json_annotation/json_annotation.dart';

import 'v2_tim_image.dart';

part 'v2_tim_image_elem.g.dart';

/// V2TimImageElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimImageElem extends Object {
  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'imageList')
  List<V2TimImage?>? imageList;

  V2TimImageElem(
    this.path,
    this.imageList,
  );

  factory V2TimImageElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimImageElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimImageElemToJson(this);
}
