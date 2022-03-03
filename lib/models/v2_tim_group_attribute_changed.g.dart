// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2_tim_group_attribute_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2TimGroupAttributeChanged _$V2TimGroupAttributeChangedFromJson(
    Map<String, dynamic> json) {
  return V2TimGroupAttributeChanged(
    json['groupID'] as String?,
    (json['groupAttributeMap'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$V2TimGroupAttributeChangedToJson(
        V2TimGroupAttributeChanged instance) =>
    <String, dynamic>{
      'groupID': instance.groupID,
      'groupAttributeMap': instance.groupAttributeMap,
    };
