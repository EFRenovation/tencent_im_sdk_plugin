import 'package:tencent_im_sdk_plugin/models/v2_tim_message_progress.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_application_processed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_application.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_grant_administrator.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_attribute_changed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_created.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_dismissed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_changed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_recycled.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_member_enter.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_member_info_changed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_member_invited.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_member_kicked.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_member_leave.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message_receipt.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_quit_from_group.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_receive_join_application.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_receive_rest_custom_data.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_c2c_custom_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_group_custom_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_group_text_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_revoke_administrator.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_signal_fullinfo.dart';

import 'v2_tim_callback.dart';

import 'v2_tim_recv_c2c_text_message.dart';
import 'v2_tim_user_full_info.dart';

/// V2TimEventCallback
///
/// {@category Models}
///
class V2TimEventCallback<T> {
  String? type;
  T? data;
  V2TimEventCallback({this.type, this.data});

  factory V2TimEventCallback.fromJson(Map<String, dynamic>? json) {
    if (T == V2TimUserFullInfo) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimUserFullInfo.fromJson(json['data']) as T,
      );
    } else if (T == V2TimCallback) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimCallback.fromJson(json['data']) as T,
      );
    } else if (T == V2TimRecvC2cTextMessage) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimRecvC2cTextMessage.fromJson(json['data']) as T,
      );
    } else if (T == V2TimRecvC2cCustomMessage) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimRecvC2cCustomMessage.fromJson(json['data']) as T,
      );
    } else if (T == V2TimRecvGroupTextMessage) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimRecvGroupTextMessage.fromJson(json['data']) as T,
      );
    } else if (T == V2TimRecvGroupCustomMessage) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimRecvGroupCustomMessage.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMessage) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMessage.fromJson(json['data']) as T,
      );
    } else if (T.toString() == "List<V2TimMessageReceipt>") {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return V2TimMessageReceipt.fromJson(e);
        })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimFriendApplication>') {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return V2TimFriendApplication.fromJson(e);
        })?.toList() as T?,
      );
    } else if (T.toString() == 'List<String>') {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return e as String;
        })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimFriendInfo>') {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return V2TimFriendInfo.fromJson(e);
        })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimConversation>') {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return V2TimConversation.fromJson(e);
        })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimGroupMemberInfo>') {
      return V2TimEventCallback(
        type: json!['type'],
        data: (json['data'] as List?)?.map((e) {
          return V2TimGroupMemberInfo.fromJson(e);
        })?.toList() as T?,
      );
    } else if (T == V2TimGroupMemberInfo) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupMemberInfo.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMemberEnter) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMemberEnter.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMemberLeave) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMemberLeave.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMemberInvited) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMemberInvited.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMemberKicked) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMemberKicked.fromJson(json['data']) as T,
      );
    } else if (T == V2TimMemberInfoChanged) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimMemberInfoChanged.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGroupCreated) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupCreated.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGroupDismissed) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupDismissed.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGroupRecycled) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupRecycled.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGroupInfoChanged) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupInfoChanged.fromJson(json['data']) as T,
      );
    } else if (T == V2TimReceiveJoinApplication) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimReceiveJoinApplication.fromJson(json['data']) as T,
      );
    } else if (T == V2TimApplicationProcessed) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimApplicationProcessed.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGrantAdministrator) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGrantAdministrator.fromJson(json['data']) as T,
      );
    } else if (T == V2TimRevokeAdministrator) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimRevokeAdministrator.fromJson(json['data']) as T,
      );
    } else if (T == V2TimQuitFromGroup) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimQuitFromGroup.fromJson(json['data']) as T,
      );
    } else if (T == V2TimReceiveRestCustomData) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimReceiveRestCustomData.fromJson(json['data']) as T,
      );
    } else if (T == V2TimGroupAttributeChanged) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimGroupAttributeChanged.fromJson(json['data']) as T,
      );
    } else if (T == MessageProgress) {
      return V2TimEventCallback(
        type: json!['type'],
        data: MessageProgress.fromJson(json['data']) as T,
      );
    } else if (T == V2TimSignalFullinfo) {
      return V2TimEventCallback(
        type: json!['type'],
        data: V2TimSignalFullinfo.fromJson(json['data']) as T,
      );
    }

    return V2TimEventCallback(
      type: json!['type'],
      data: json['data'],
    );
  }
  toJson() {
    if (T == V2TimUserFullInfo) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimUserFullInfo).toJson()
      };
    } else if (T == V2TimCallback) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimCallback).toJson()
      };
    } else if (T == V2TimRecvC2cTextMessage) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimRecvC2cTextMessage).toJson()
      };
    } else if (T == V2TimRecvC2cCustomMessage) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimRecvC2cCustomMessage).toJson()
      };
    } else if (T == V2TimRecvGroupTextMessage) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimRecvGroupTextMessage).toJson()
      };
    } else if (T == V2TimRecvGroupCustomMessage) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimRecvGroupCustomMessage).toJson()
      };
    } else if (T == V2TimMessage) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMessage).toJson()
      };
    } else if (T.toString() == "List<V2TimMessageReceipt>") {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as List)
            .map((e) => (e as V2TimMessageReceipt).toJson())
            .toList(),
      };
    } else if (T.toString() == 'List<V2TimFriendInfo>') {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as List)
            .map((e) => (e as V2TimFriendInfo).toJson())
            .toList(),
      };
    } else if (T.toString() == 'List<String>') {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as List).map((e) => e as String).toList(),
      };
    } else if (T == V2TimMemberEnter) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMemberEnter).toJson()
      };
    } else if (T == V2TimMemberLeave) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMemberLeave).toJson()
      };
    } else if (T == V2TimMemberInvited) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMemberInvited).toJson()
      };
    } else if (T == V2TimMemberKicked) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMemberKicked).toJson()
      };
    } else if (T == V2TimMemberInfoChanged) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimMemberInfoChanged).toJson()
      };
    } else if (T == V2TimGroupCreated) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGroupCreated).toJson()
      };
    } else if (T == V2TimGroupDismissed) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGroupDismissed).toJson()
      };
    } else if (T == V2TimGroupRecycled) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGroupRecycled).toJson()
      };
    } else if (T == V2TimGroupInfoChanged) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGroupInfoChanged).toJson()
      };
    } else if (T == V2TimReceiveJoinApplication) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimReceiveJoinApplication).toJson()
      };
    } else if (T == V2TimApplicationProcessed) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimApplicationProcessed).toJson()
      };
    } else if (T == V2TimGrantAdministrator) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGrantAdministrator).toJson()
      };
    } else if (T == V2TimRevokeAdministrator) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimRevokeAdministrator).toJson()
      };
    } else if (T == V2TimQuitFromGroup) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimQuitFromGroup).toJson()
      };
    } else if (T == V2TimReceiveRestCustomData) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimReceiveRestCustomData).toJson()
      };
    } else if (T == V2TimGroupAttributeChanged) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimGroupAttributeChanged).toJson()
      };
    } else if (T == MessageProgress) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as MessageProgress).toJson()
      };
    } else if (T == V2TimSignalFullinfo) {
      return <String, dynamic>{
        "type": this.type,
        "data": (this.data as V2TimSignalFullinfo).toJson()
      };
    }
    return <String, dynamic>{
      "type": this.type,
      "data": this.data,
    };
  }
}
