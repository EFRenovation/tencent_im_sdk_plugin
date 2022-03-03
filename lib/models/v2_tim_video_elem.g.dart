// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_video_elem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimVideoElem _$V2TimVideoElemFromJson(Map<String, dynamic> json) {
  return V2TimVideoElem(
    json['videoPath'] as String?,
    json['UUID'] as String?,
    json['videoSize'] as int?,
    json['duration'] as int?,
    json['snapshotPath'] as String?,
    json['snapshotUUID'] as String?,
    json['snapshotSize'] as int?,
    json['snapshotWidth'] as int?,
    json['snapshotHeight'] as int?,
    json['videoUrl'] as String?,
    json['snapshotUrl'] as String?,
  );
}

Map<String, dynamic> _$V2TimVideoElemToJson(V2TimVideoElem instance) =>
    <String, dynamic>{
      'videoPath': instance.videoPath,
      'UUID': instance.uUID,
      'videoSize': instance.videoSize,
      'duration': instance.duration,
      'snapshotPath': instance.snapshotPath,
      'snapshotUUID': instance.snapshotUUID,
      'snapshotSize': instance.snapshotSize,
      'snapshotWidth': instance.snapshotWidth,
      'snapshotHeight': instance.snapshotHeight,
      'videoUrl': instance.videoUrl,
      'snapshotUrl': instance.snapshotUrl,
    };
