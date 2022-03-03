import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_sound_elem.g.dart';

/// V2TimSoundElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimSoundElem extends Object {
  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'UUID')
  String? UUID;

  @JsonKey(name: 'dataSize')
  int? dataSize;

  @JsonKey(name: 'duration')
  int? duration;

  @JsonKey(name: 'url')
  String? url;

  V2TimSoundElem(
    this.path,
    this.UUID,
    this.dataSize,
    this.duration,
    this.url,
  );

  factory V2TimSoundElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimSoundElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimSoundElemToJson(this);
}
