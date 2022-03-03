import 'package:json_annotation/json_annotation.dart';

part 'v2_tim_message_receipt.g.dart';

/// V2TimMessageReceipt
///
/// {@category Models}
///
@JsonSerializable()
class V2TimMessageReceipt extends Object {
  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'timestamp')
  int? timestamp;

  V2TimMessageReceipt(
    this.userID,
    this.timestamp,
  );

  factory V2TimMessageReceipt.fromJson(Map<String, dynamic> srcJson) =>
      _$V2TimMessageReceiptFromJson(srcJson);

  Map<String, dynamic> toJson() => _$V2TimMessageReceiptToJson(this);
}
