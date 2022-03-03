import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_file_elem.g.dart';

/// V2TimFileElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimFileElem extends Object {
  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'fileName')
  String? fileName;

  @JsonKey(name: 'UUID')
  String? uUID;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'fileSize')
  int? fileSize;

  V2TimFileElem(
    this.path,
    this.fileName,
    this.uUID,
    this.fileSize,
    this.url,
  );

  factory V2TimFileElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimFileElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimFileElemToJson(this);
}
