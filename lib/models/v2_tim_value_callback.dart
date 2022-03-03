import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_application_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_check_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_group.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_operation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_application_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_full_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_operation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';
import 'v2_tim_user_full_info.dart';

import 'dart:convert';

dynamic decode = json.decode;
dynamic encode = json.encode;

/// V2TimValueCallback
///
/// {@category Models}
///
class V2TimValueCallback<T> {
  int? code;
  String? desc;
  T? data;
  V2TimValueCallback({this.code, this.desc, this.data});

  factory V2TimValueCallback.fromJson(Map<String, dynamic>? json) {
    if (T == V2TimMessage) {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimMessage.fromJson(json['data']) as T,
      );
    } else if (T == String) {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'],
      );
    } else if (T == bool) {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'],
      );
    } else if (T == int) {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'],
      );
    } else if (T == V2TimUserFullInfo) {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimUserFullInfo.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimUserFullInfo>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimUserFullInfo.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'String') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'],
      );
    } else if (T.toString() == 'List<V2TimGroupInfo>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimGroupInfo.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimGroupInfoResult>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimGroupInfoResult.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'Map<String, String>') {
      Map<String, String> data = new Map<String, String>.from(json!['data']);
      return V2TimValueCallback(
        code: json['code'],
        desc: json['desc'],
        data: json['data'] == null ? null : data as T,
      );
    } else if (T.toString() == 'V2TimGroupMemberInfoResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimGroupMemberInfoResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimGroupMemberFullInfo>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimGroupMemberFullInfo.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimGroupMemberOperationResult>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimGroupMemberOperationResult.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'V2TimGroupApplicationResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimGroupApplicationResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'V2TimConversationResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimConversationResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'V2TimConversation') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimConversation.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimFriendInfo>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimFriendInfo.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimFriendInfoResult>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimFriendInfoResult.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'V2TimFriendOperationResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimFriendOperationResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimFriendOperationResult>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimFriendOperationResult.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'V2TimFriendCheckResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimFriendCheckResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimFriendCheckResult>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimFriendCheckResult.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'V2TimFriendApplicationResult') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : V2TimFriendApplicationResult.fromJson(json['data']) as T,
      );
    } else if (T.toString() == 'List<V2TimFriendGroup>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimFriendGroup.fromJson(e);
              })?.toList() as T?,
      );
    } else if (T.toString() == 'List<V2TimMessage>') {
      return V2TimValueCallback(
        code: json!['code'],
        desc: json['desc'],
        data: json['data'] == null
            ? null
            : (json['data'] as List?)?.map((e) {
                return V2TimMessage.fromJson(e);
              })?.toList() as T?,
      );
    }

    return V2TimValueCallback(
      code: json!['code'],
      desc: json['desc'],
    );
  }

  toJson() {
    if (T == V2TimMessage) {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null ? null : (this.data as V2TimMessage).toJson()
      };
    }
    if (T.toString() == 'List<V2TimUserFullInfo>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimUserFullInfo).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimGroupInfo>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimGroupInfo).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimGroupInfoResult>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List?)?.map((e) {
                return (e as V2TimGroupInfoResult).toJson();
              })?.toList(),
      };
    }
    if (T.toString() == 'V2TimGroupMemberInfoResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as V2TimGroupMemberInfoResult).toJson()
      };
    }
    if (T.toString() == 'List<V2TimGroupMemberFullInfo>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimGroupMemberFullInfo).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimGroupMemberOperationResult>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimGroupMemberOperationResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'V2TimGroupApplicationResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as V2TimGroupApplicationResult).toJson()
      };
    }
    if (T.toString() == 'V2TimConversationResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as V2TimConversationResult).toJson()
      };
    }
    if (T.toString() == 'V2TimConversation') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data":
            this.data == null ? null : (this.data as V2TimConversation).toJson()
      };
    }
    if (T.toString() == 'List<V2TimFriendInfo>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendInfo).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimFriendInfoResult>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendInfoResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'V2TimFriendOperationResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendOperationResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimFriendOperationResult>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendOperationResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'V2TimFriendCheckResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendCheckResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimFriendCheckResult>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendCheckResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'V2TimFriendApplicationResult') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendApplicationResult).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimFriendGroup>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimFriendGroup).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'List<V2TimMessage>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null
            ? null
            : (this.data as List)
                .map((e) => (e as V2TimMessage).toJson())
                .toList(),
      };
    }
    if (T.toString() == 'Map<String, String>') {
      return <String, dynamic>{
        "code": this.code,
        "desc": this.desc,
        "data": this.data == null ? null : this.data as Map<String, String>?,
      };
    }
    return <String, dynamic>{
      "code": this.code,
      "desc": this.desc,
      "data": this.data
    };
  }
}
