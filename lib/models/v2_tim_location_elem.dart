import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_location_elem.g.dart';

/// V2TimLocationElem
///
/// {@category Models}
///
@JsonSerializable()
class V2TimLocationElem extends Object {
  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'longitude')
  double? longitude;

  @JsonKey(name: 'latitude')
  double? latitude;

  V2TimLocationElem(
    this.desc,
    this.longitude,
    this.latitude,
  );

  factory V2TimLocationElem.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimLocationElemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimLocationElemToJson(this);
}
