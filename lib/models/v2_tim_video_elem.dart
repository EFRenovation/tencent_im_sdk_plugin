import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_video_elem.g.dart';

/// V2TimVideoElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimVideoElem extends Object {
  @JsonKey(name: 'videoPath')
  String? videoPath;

  @JsonKey(name: 'UUID')
  String? uUID;

  @JsonKey(name: 'videoSize')
  int? videoSize;

  @JsonKey(name: 'duration')
  int? duration;

  @JsonKey(name: 'snapshotPath')
  String? snapshotPath;

  @JsonKey(name: 'snapshotUUID')
  String? snapshotUUID;

  @JsonKey(name: 'snapshotSize')
  int? snapshotSize;

  @JsonKey(name: 'snapshotWidth')
  int? snapshotWidth;

  @JsonKey(name: 'snapshotHeight')
  int? snapshotHeight;

  @JsonKey(name: 'videoUrl')
  String? videoUrl;

  @JsonKey(name: 'snapshotUrl')
  String? snapshotUrl;

  V2TimVideoElem(
    this.videoPath,
    this.uUID,
    this.videoSize,
    this.duration,
    this.snapshotPath,
    this.snapshotUUID,
    this.snapshotSize,
    this.snapshotWidth,
    this.snapshotHeight,
    this.videoUrl,
    this.snapshotUrl,
  );

  factory V2TimVideoElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimVideoElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimVideoElemToJson(this);
}
