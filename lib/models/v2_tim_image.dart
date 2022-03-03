import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_image.g.dart';

/// V2TimImage
///
/// {@category Models}
///
@JsonSerializable()
class V2TimImage extends Object {
  @JsonKey(name: 'UUID')
  String? UUID;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'size')
  int? size;

  @JsonKey(name: 'width')
  int? width;

  @JsonKey(name: 'height')
  int? height;

  @JsonKey(name: 'url')
  String? url;

  V2TimImage(
    this.UUID,
    this.type,
    this.size,
    this.width,
    this.height,
    this.url,
  );

  factory V2TimImage.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimImageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimImageToJson(this);
}
