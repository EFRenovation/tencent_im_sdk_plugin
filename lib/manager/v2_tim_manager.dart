import 'dart:convert';
import 'dart:io';

import 'package:tencent_im_sdk_plugin/enum/listener_type.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_conversation_manager.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_friendship_manager.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_group_manager.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_message_manager.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_offline_push_manager.dart';
import 'package:tencent_im_sdk_plugin/manager/v2_tim_signaling_manager.dart';
import 'package:flutter/services.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message_progress.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_application_processed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_event_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_application.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_grant_administrator.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_attribute_changed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_created.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_dismissed.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_changed.dart';
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
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_c2c_text_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_group_custom_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_recv_group_text_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_revoke_administrator.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_signal_fullinfo.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_user_full_info.dart';

/// IM SDK 主核心类，负责 IM SDK 的初始化、登录、消息收发，建群退群等功能。
///
///[initSDK] 初始化 SDK
///
///[unInitSDK] 反初始化 SDK
///
///[login] 登录
///
///[logout] 登出
///
///[getLoginUser] 获取登录用户
///
///[getLoginStatus] 获取登录状态
///
///[addSimpleMsgListener] 设置基本消息（文本消息和自定义消息）的事件监听器
///
///[removeSimpleMsgListener] 移除基本消息（文本消息和自定义消息）的事件监听器
///
///[sendC2CTextMessage] 发送单聊普通文本消息（最大支持 8KB）
///
///[sendC2CCustomMessage] 发送单聊自定义（信令）消息（最大支持 8KB）
///
///[sendGroupTextMessage] 发送群聊普通文本消息（最大支持 8KB）
///
///[sendGroupCustomMessage] 发送群聊自定义（信令）消息（最大支持 8KB）
///
///[setGroupListener] 设置群组监听器
///
///[createGroup] 创建群组
///
///[joinGroup] 加入群组
///
///[quitGroup] 退出群组
///
///{@category Manager}
///
class V2TIMManager {
  ///@nodoc
  late MethodChannel _channel;

  ///@nodoc
  V2TIMConversationManager? v2ConversationManager;

  ///@nodoc
  V2TIMMessageManager? v2TIMMessageManager;

  ///@nodoc
  V2TIMFriendshipManager? v2TIMFriendshipManager;

  ///@nodoc
  V2TIMGroupManager? v2TIMGroupManager;

  ///@nodoc
  V2TIMOfflinePushManager? v2TIMOfflinePushManager;

  ///@nodoc
  V2TIMSignalingManager? v2timSignalingManager;

  ///@nodoc
  Set simpleMsgListener = new Set();

  ///@nodoc
  Set initSDKListener = new Set();

  ///@nodoc
  Set groupListener = new Set();

  ///@nodoc
  V2TIMManager(MethodChannel channel) {
    this._channel = channel;
    this.v2ConversationManager = new V2TIMConversationManager(channel);
    this.v2TIMMessageManager = new V2TIMMessageManager(channel);
    this.v2TIMFriendshipManager = new V2TIMFriendshipManager(channel);
    this.v2TIMGroupManager = new V2TIMGroupManager(channel);
    this.v2TIMOfflinePushManager = new V2TIMOfflinePushManager(channel);
    this.v2timSignalingManager = new V2TIMSignalingManager(channel);
    this.addNativeCallback(channel);
  }

  ///@nodoc
  void addNativeCallback(MethodChannel _channel) {
    var forReturn;
    _channel.setMethodCallHandler((call) {
      try {
        if (call.method == ListenerType.simpleMsgListener) {
          String? type = call.arguments['type'];
          for (var item in simpleMsgListener) {
            if (type == "onRecvC2CTextMessage") {
              V2TimEventCallback<V2TimRecvC2cTextMessage> data =
                  V2TimEventCallback<V2TimRecvC2cTextMessage>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == "onRecvC2CCustomMessage") {
              V2TimEventCallback<V2TimRecvC2cCustomMessage> data =
                  V2TimEventCallback<V2TimRecvC2cCustomMessage>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == "onRecvGroupTextMessage") {
              V2TimEventCallback<V2TimRecvGroupTextMessage> data =
                  V2TimEventCallback<V2TimRecvGroupTextMessage>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == "onRecvGroupCustomMessage") {
              V2TimEventCallback<V2TimRecvGroupCustomMessage> data =
                  V2TimEventCallback<V2TimRecvGroupCustomMessage>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == ListenerType.initSDKListener) {
          String? type = call.arguments['type'];
          for (var item in initSDKListener) {
            if (type == 'onSelfInfoUpdated') {
              V2TimEventCallback<V2TimUserFullInfo> data =
                  V2TimEventCallback<V2TimUserFullInfo>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onConnectFailed') {
              V2TimEventCallback<V2TimCallback> data =
                  V2TimEventCallback<V2TimCallback>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == ListenerType.groupListener) {
          String? type = call.arguments['type'];
          for (var item in groupListener) {
            if (type == 'onMemberEnter') {
              V2TimEventCallback<V2TimMemberEnter> data =
                  V2TimEventCallback<V2TimMemberEnter>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onMemberLeave') {
              V2TimEventCallback<V2TimMemberLeave> data =
                  V2TimEventCallback<V2TimMemberLeave>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onMemberInvited') {
              V2TimEventCallback<V2TimMemberInvited> data =
                  V2TimEventCallback<V2TimMemberInvited>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onMemberKicked') {
              V2TimEventCallback<V2TimMemberKicked> data =
                  V2TimEventCallback<V2TimMemberKicked>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onMemberInfoChanged') {
              V2TimEventCallback<V2TimMemberInfoChanged> data =
                  V2TimEventCallback<V2TimMemberInfoChanged>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGroupCreated') {
              V2TimEventCallback<V2TimGroupCreated> data =
                  V2TimEventCallback<V2TimGroupCreated>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGroupDismissed') {
              V2TimEventCallback<V2TimGroupDismissed> data =
                  V2TimEventCallback<V2TimGroupDismissed>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGroupRecycled') {
              V2TimEventCallback<V2TimGroupRecycled> data =
                  V2TimEventCallback<V2TimGroupRecycled>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGroupInfoChanged') {
              V2TimEventCallback<V2TimGroupInfoChanged> data =
                  V2TimEventCallback<V2TimGroupInfoChanged>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onReceiveJoinApplication') {
              V2TimEventCallback<V2TimReceiveJoinApplication> data =
                  V2TimEventCallback<V2TimReceiveJoinApplication>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onApplicationProcessed') {
              V2TimEventCallback<V2TimApplicationProcessed> data =
                  V2TimEventCallback<V2TimApplicationProcessed>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGrantAdministrator') {
              V2TimEventCallback<V2TimGrantAdministrator> data =
                  V2TimEventCallback<V2TimGrantAdministrator>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onRevokeAdministrator') {
              V2TimEventCallback<V2TimRevokeAdministrator> data =
                  V2TimEventCallback<V2TimRevokeAdministrator>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onQuitFromGroup') {
              V2TimEventCallback<V2TimQuitFromGroup> data =
                  V2TimEventCallback<V2TimQuitFromGroup>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onReceiveRESTCustomData') {
              V2TimEventCallback<V2TimReceiveRestCustomData> data =
                  V2TimEventCallback<V2TimReceiveRestCustomData>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onGroupAttributeChanged') {
              V2TimEventCallback<V2TimGroupAttributeChanged> data =
                  V2TimEventCallback<V2TimGroupAttributeChanged>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          String? type = call.arguments['type'];
          for (var item in this.v2TIMMessageManager!.advancedMsgListener) {
            if (type == 'onRecvNewMessage') {
              V2TimEventCallback<V2TimMessage> data =
                  V2TimEventCallback<V2TimMessage>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onRecvC2CReadReceipt') {
              V2TimEventCallback<List<V2TimMessageReceipt>> data =
                  V2TimEventCallback<List<V2TimMessageReceipt>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onRecvMessageRevoked') {
              V2TimEventCallback<String> data =
                  V2TimEventCallback<String>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onSendMessageProgress') {
              V2TimEventCallback<MessageProgress> data =
                  V2TimEventCallback<MessageProgress>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == ListenerType.conversationListener) {
          String? type = call.arguments['type'];
          for (var item in this.v2ConversationManager!.conversationListener) {
            if (type == 'onNewConversation') {
              V2TimEventCallback<List<V2TimConversation>> data =
                  V2TimEventCallback<List<V2TimConversation>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onConversationChanged') {
              V2TimEventCallback<List<V2TimConversation>> data =
                  V2TimEventCallback<List<V2TimConversation>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == ListenerType.friendListener) {
          String? type = call.arguments['type'];
          for (var item in this.v2TIMFriendshipManager!.friendListener) {
            if (type == 'onFriendApplicationListAdded') {
              V2TimEventCallback<List<V2TimFriendApplication>> data =
                  V2TimEventCallback<List<V2TimFriendApplication>>.fromJson(
                formatJson(call.arguments),
              );

              item(data);
            } else if (type == 'onFriendApplicationListDeleted') {
              V2TimEventCallback<List<String>> data =
                  V2TimEventCallback<List<String>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onFriendApplicationListRead') {
              V2TimEventCallback data = V2TimEventCallback.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onFriendListDeleted') {
              V2TimEventCallback<List<String>> data =
                  V2TimEventCallback<List<String>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onFriendListAdded') {
              V2TimEventCallback<List<V2TimFriendInfo>> data =
                  V2TimEventCallback<List<V2TimFriendInfo>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onBlackListAdd') {
              V2TimEventCallback<List<V2TimFriendInfo>> data =
                  V2TimEventCallback<List<V2TimFriendInfo>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onBlackListDeleted') {
              V2TimEventCallback<List<String>> data =
                  V2TimEventCallback<List<String>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onBlackListAdd') {
              V2TimEventCallback<List<V2TimFriendInfo>> data =
                  V2TimEventCallback<List<V2TimFriendInfo>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else if (type == 'onFriendInfoChanged') {
              V2TimEventCallback<List<V2TimFriendInfo>> data =
                  V2TimEventCallback<List<V2TimFriendInfo>>.fromJson(
                formatJson(call.arguments),
              );
              item(data);
            } else {
              item(V2TimEventCallback.fromJson(formatJson(call.arguments)));
            }
          }
        } else if (call.method == 'logFromSwift') {
          var data = call.arguments["data"];
          var msg = call.arguments["msg"];
          print('========> $msg: $data');
        } else if (call.method == ListenerType.signalingListener) {
          // String type = call.arguments['type'];
          V2TimEventCallback<V2TimSignalFullinfo> data =
              V2TimEventCallback<V2TimSignalFullinfo>.fromJson(
            formatJson(call.arguments),
          );
          for (var item in this.v2timSignalingManager!.signalingListener) {
            item(data);
          }
        }
      } catch (err) {
        print(
            "重点关注，回调失败了，数据类型异常。$err ${call.method} ${call.arguments['type']} ${call.arguments['data']}");
      }
      return forReturn;
    });
  }

  /// 初始化SDK
  ///
  /// 参数
  ///
  /// ```
  /// @required int sdkAppID	应用 ID，必填项，可以在控制台中获取
  /// @required int loglevel	配置信息
  /// @required [InitListener] listener	SDK的回调
  /// ```
  ///
  /// 返回
  /// ```
  /// true：成功；
  /// false：失败
  /// ```
  Future<V2TimValueCallback<bool>> initSDK({
    required int sdkAppID,
    required int loglevel,
    required Function listener,
  }) async {
    initSDKListener.add(listener);
    return V2TimValueCallback<bool>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'initSDK',
          buildParam(
            {
              "sdkAppID": sdkAppID,
              "logLevel": loglevel,
            },
          ),
        ),
      ),
    );
  }

  ///反初始化 SDK
  ///
  Future<V2TimCallback> unInitSDK() async {
    initSDKListener.clear();
    return V2TimCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'unInitSDK',
          buildParam(
            {},
          ),
        ),
      ),
    );
  }

  /// 获取版本号
  ///
  Future<V2TimValueCallback<String>> getVersion() async {
    return V2TimValueCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'getVersion',
          buildParam(
            {},
          ),
        ),
      ),
    );
  }

  /// 获取服务器当前时间
  ///
  Future<V2TimValueCallback<int>> getServerTime() async {
    return V2TimValueCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'getServerTime',
          buildParam(
            {},
          ),
        ),
      ),
    );
  }

  /// 登录
  ///
  /// 参数
  ///
  /// ```
  /// @required String userID,
  /// @required String userSig,
  /// ```
  ///
  /// ```
  /// 登录需要设置用户名 userID 和用户签名 userSig，userSig 生成请参考 UserSig 后台 API。
  /// ```
  ///
  /// 注意
  ///
  /// ```
  /// 登陆时票据过期：login 函数的回调会返回 ERR_USER_SIG_EXPIRED：6206 错误码，此时生成新的 userSig 重新登录。
  /// 在线时票据过期：用户在线期间也可能收到 V2TIMListener -> onUserSigExpired 回调，此时也是需要您生成新的 userSig 并重新登录。
  /// 在线时被踢下线：用户在线情况下被踢，SDK 会通过 V2TIMListener -> onKickedOffline 回调通知给您，此时可以 UI 提示用户，并再次调用 login() 重新登录。
  /// ```
  Future<V2TimCallback> login({
    required String userID,
    required String userSig,
  }) async {
    var data = await _channel.invokeMethod(
      'login',
      buildParam({
        "userID": userID,
        "userSig": userSig,
      }),
    );
    return V2TimCallback.fromJson(
      formatJson(data),
    );
  }

  /// 登出
  ///
  ///```
  /// 退出登录，如果切换账号，需要 logout 回调成功或者失败后才能再次 login，否则 login 可能会失败。
  ///```
  Future<V2TimCallback> logout() async {
    var data = await _channel.invokeMethod('logout', buildParam({}));
    return V2TimCallback.fromJson(
      formatJson(data),
    );
  }

  /// 获取登录用户
  ///
  Future<V2TimValueCallback<String>> getLoginUser() async {
    return V2TimValueCallback<String>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'getLoginUser',
          buildParam(
            {},
          ),
        ),
      ),
    );
  }

  /// 获取登录状态
  ///
  ///```
  /// 如果用户已经处于已登录和登录中状态，请勿再频繁调用登录接口登录。
  /// ```
  ///
  /// 返回
  ///
  ///```
  /// 登录状态
  /// V2TIM_STATUS_LOGINED 已登录
  /// V2TIM_STATUS_LOGINING 登录中
  /// V2TIM_STATUS_LOGOUT 无登录
  /// ```
  Future<V2TimValueCallback<int>> getLoginStatus() async {
    return V2TimValueCallback<int>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'getLoginStatus',
          buildParam(
            {},
          ),
        ),
      ),
    );
  }

  /// 发送单聊普通文本消息（最大支持 8KB）
  ///
  /// ```
  /// 文本消息支持云端的脏词过滤，如果用户发送的消息中有敏感词，callback 回调将会返回 80001 错误码。
  /// ```
  /// 返回
  ///
  /// ```
  /// 返回消息的唯一标识 ID
  /// ```
  /// 注意
  ///
  /// ```
  /// 该接口发送的消息默认会推送（前提是在 V2TIMOfflinePushManager 开启了推送），如果需要自定义推送（标题和内容），请调用 V2TIMMessageManager.sendMessage 接口。
  /// ```
  Future<V2TimValueCallback<V2TimMessage>> sendC2CTextMessage({
    required String text,
    required String userID,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'sendC2CTextMessage',
          buildParam(
            {
              "text": text,
              "userID": userID,
            },
          ),
        ),
      ),
    );
  }

  /// 发送单聊自定义（信令）消息（最大支持 8KB）
  ///
  /// ```
  /// 自定义消息本质就是一端二进制 buffer，您可以在其上自由组织自己的消息格式（常用于发送信令），但是自定义消息不支持云端敏感词过滤。
  /// ```
  ///
  /// 返回
  ///
  /// ```
  /// 返回消息的唯一标识 ID
  /// ```
  ///
  /// 注意
  /// ```
  /// 该接口发送的消息默认不会推送，如果需要推送，请调用 V2TIMMessageManager.sendMessage 接口。
  /// ```
  Future<V2TimValueCallback<V2TimMessage>> sendC2CCustomMessage({
    required String customData,
    required String userID,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          'sendC2CCustomMessage',
          buildParam(
            {
              "customData": customData,
              "userID": userID,
            },
          ),
        ),
      ),
    );
  }

  /// 发送群聊普通文本消息（最大支持 8KB）
  ///
  /// 参数
  ///
  /// ```
  /// priority	设置消息的优先级，我们没有办法所有消息都能 100% 送达每一个用户，但高优先级的消息会有更高的送达成功率。
  /// V2TIMMessage.V2TIM_PRIORITY_HIGH：云端会优先传输，适用于在群里发送重要消息，比如主播发送的文本消息等。
  /// V2TIMMessage.V2TIM_PRIORITY_NORMAL：云端按默认优先级传输，适用于在群里发送非重要消息，比如观众发送的弹幕消息等。
  /// ```
  ///
  /// 返回
  ///
  /// ```
  /// 返回消息的唯一标识 ID
  /// ```
  ///
  /// 注意
  ///
  /// ```
  /// 该接口发送的消息默认会推送（前提是在 V2TIMOfflinePushManager 开启了推送），如果需要自定义推送（标题和内容），请调用 V2TIMMessageManager.sendMessage 接口。
  /// ```
  Future<V2TimValueCallback<V2TimMessage>> sendGroupTextMessage({
    required String text,
    required String groupID,
    required int priority,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "sendGroupTextMessage",
          buildParam(
            {
              "text": text,
              "groupID": groupID,
              "priority": priority,
            },
          ),
        ),
      ),
    );
  }

  /// 发送群聊自定义（信令）消息（最大支持 8KB）
  ///
  /// 参数
  ///
  /// ```
  /// priority	设置消息的优先级，我们没有办法所有消息都能 100% 送达每一个用户，但高优先级的消息会有更高的送达成功率。
  /// V2TIMMessage.V2TIM_PRIORITY_HIGH：云端会优先传输，适用于在群里发送重要信令，比如连麦邀请，PK邀请、礼物赠送等关键性信令。
  /// V2TIMMessage.V2TIM_PRIORITY_NORMAL：云端按默认优先级传输，适用于在群里发送非重要信令，比如观众的点赞提醒等等。
  /// ```
  /// 返回
  ///
  /// ```
  /// 返回消息的唯一标识 ID
  /// ```
  ///
  /// 注意
  ///
  /// ```
  /// 该接口发送的消息默认不会推送，如果需要推送，请调用 V2TIMMessageManager.sendMessage 接口。
  /// ```
  Future<V2TimValueCallback<V2TimMessage>> sendGroupCustomMessage({
    required String customData,
    required String groupID,
    required int priority,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "sendGroupCustomMessage",
          buildParam(
            {
              "customData": customData,
              "groupID": groupID,
              "priority": priority,
            },
          ),
        ),
      ),
    );
  }

  /// 创建群组
  ///
  ///参数
  ///```
  /// groupType	群类型，我们为您预定义好了四种常用的群类型，您也可以在控制台定义自己需要的群类型：
  ///
  ///   "Work" ：工作群，成员上限 200 人，不支持由用户主动加入，需要他人邀请入群，适合用于类似微信中随意组建的工作群（对应老版本的 Private 群）。
  ///
  ///   "Public" ：公开群，成员上限 2000 人，任何人都可以申请加群，但加群需群主或管理员审批，适合用于类似 QQ 中由群主管理的兴趣群。
  ///
  ///   "Meeting" ：会议群，成员上限 6000 人，任何人都可以自由进出，且加群无需被审批，适合用于视频会议和在线培训等场景（对应老版本的 ChatRoom 群）。
  ///
  ///   "AVChatRoom" ：直播群，人数无上限，任何人都可以自由进出，消息吞吐量大，适合用作直播场景中的高并发弹幕聊天室。
  ///
  /// groupID	自定义群组 ID，可以传 null。传 null 时系统会自动分配 groupID，并通过 callback 返回。
  ///
  /// groupName	群名称，不能为 null。
  ///```
  /// 注意
  ///
  ///```
  /// 不支持在同一个 SDKAPPID 下创建两个相同 groupID 的群
  /// ```
  Future<V2TimValueCallback<String>> createGroup({
    required String groupType,
    required String groupName,
    String? groupID,
  }) async {
    return V2TimValueCallback<String>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          Platform.isIOS ? "createGroupSimple" : "createGroup",
          buildParam(
            {
              "groupType": groupType,
              "groupName": groupName,
              "groupID": groupID,
            },
          ),
        ),
      ),
    );
  }

  /// 加入群组
  ///
  /// 注意
  ///
  /// ```
  /// 工作群（Work）：不能主动入群，只能通过群成员调用 V2TIMManager.getGroupManager().inviteUserToGroup() 接口邀请入群。
  /// 公开群（Public）：申请入群后，需要管理员审批，管理员在收到 V2TIMGroupListener -> onReceiveJoinApplication 回调后调用 V2TIMManager.getGroupManager().getGroupApplicationList() 接口处理加群请求。
  /// 其他群：可以直接入群。
  /// ```
  Future<V2TimCallback> joinGroup({
    required String groupID,
    required String message,
  }) async {
    return V2TimCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "joinGroup",
          buildParam(
            {
              "groupID": groupID,
              "message": message,
            },
          ),
        ),
      ),
    );
  }

  /// 退出群组
  ///
  /// 注意
  ///
  /// ```
  /// 在公开群（Public）、会议（Meeting）和直播群（AVChatRoom）中，群主是不可以退群的，群主只能调用 dismissGroup 解散群组。
  /// ```
  Future<V2TimCallback> quitGroup({
    required String groupID,
  }) async {
    return V2TimCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "quitGroup",
          buildParam(
            {
              "groupID": groupID,
            },
          ),
        ),
      ),
    );
  }

  /// 解散群组
  ///
  /// 注意
  ///
  /// ```
  /// Work：任何人都无法解散群组。
  /// 其他群：群主可以解散群组。
  /// ```
  Future<V2TimCallback> dismissGroup({
    required String groupID,
  }) async {
    return V2TimCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "dismissGroup",
          buildParam(
            {
              "groupID": groupID,
            },
          ),
        ),
      ),
    );
  }

  /// 获取用户资料
  ///
  /// 注意
  ///
  /// ```
  /// 获取自己的资料，传入自己的 ID 即可。
  /// userIDList 建议一次最大 100 个，因为数量过多可能会导致数据包太大被后台拒绝，后台限制数据包最大为 1M。
  /// ```
  Future<V2TimValueCallback<List<V2TimUserFullInfo>>> getUsersInfo({
    required List<String> userIDList,
  }) async {
    return V2TimValueCallback<List<V2TimUserFullInfo>>.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "getUsersInfo",
          buildParam(
            {
              "userIDList": userIDList,
            },
          ),
        ),
      ),
    );
  }

  /// 修改个人资料
  ///
  Future<V2TimCallback> setSelfInfo({
    String? userID,
    String? nickName,
    String? faceUrl,
    String? selfSignature,
    int? gender,
    int? allowType,
    Map<String, String>? customInfo,
  }) async {
    return V2TimCallback.fromJson(
      formatJson(
        await _channel.invokeMethod(
          "setSelfInfo",
          buildParam(
            {
              "userID": userID,
              "nickName": nickName,
              "faceUrl": faceUrl,
              "selfSignature": selfSignature,
              "gender": gender,
              "allowType": allowType,
              "customInfo": customInfo
            },
          ),
        ),
      ),
    );
  }

  /// 高级消息功能入口
  ///
  /// 返回
  ///
  /// ```
  /// 高级消息管理类实例
  /// ```
  V2TIMMessageManager? getMessageManager() {
    return this.v2TIMMessageManager;
  }

  /// 高级群组功能入口
  ///
  /// 返回
  ///
  /// ```
  /// 高级群组管理类实例
  /// ```
  V2TIMGroupManager? getGroupManager() {
    return this.v2TIMGroupManager;
  }

  /// 会话功能入口
  ///
  /// 返回
  ///
  /// ```
  /// 会话管理类实例
  /// ```
  V2TIMConversationManager? getConversationManager() {
    return this.v2ConversationManager;
  }

  /// 关系链功能入口
  ///
  /// 返回
  ///
  /// ```
  /// 关系链管理类实例
  /// ```
  V2TIMFriendshipManager? getFriendshipManager() {
    return this.v2TIMFriendshipManager;
  }

  /// 离线推送功能入口
  ///
  /// 返回
  ///
  /// ```
  /// 离线推送功能类实例
  /// ```
  V2TIMOfflinePushManager? getOfflinePushManager() {
    return this.v2TIMOfflinePushManager;
  }

  /// 信令入口
  ///
  /// 返回
  ///
  /// ```
  /// 信令管理类实例
  /// ```
  V2TIMSignalingManager? getSignalingManager() {
    return this.v2timSignalingManager;
  }

  /// 设置基本消息（文本消息和自定义消息）的事件监听器
  ///
  /// 注意
  ///
  /// ```
  /// 图片消息、视频消息、语音消息等高级消息的监听，请参考: V2TIMMessageManager.addAdvancedMsgListener(V2TIMAdvancedMsgListener) 。
  /// ```
  void addSimpleMsgListener({
    required Function listener,
  }) {
    this.simpleMsgListener.add(listener);
    _channel.invokeMethod("addSimpleMsgListener", buildParam({}));
  }

  /// 移除基本消息（文本消息和自定义消息）的事件监听器
  ///
  void removeSimpleMsgListener() {
    this.simpleMsgListener.clear();
    _channel.invokeMethod("removeSimpleMsgListener", buildParam({}));
  }

  /// 设置群组监听器
  ///
  void setGroupListener({
    required Function listener,
  }) {
    groupListener.add(listener);
    _channel.invokeMethod("setGroupListener", buildParam({}));
  }

  /// 设置apns监听
  ///
  Future setAPNSListener() {
    return _channel.invokeMethod("setAPNSListener", buildParam({}));
  }

  ///@nodoc
  formatJson(jsonSrc) {
    return json.decode(json.encode(jsonSrc));
  }

  ///@nodoc
  Map buildParam(Map param) {
    param["TIMManagerName"] = "timManager";
    return param;
  }
}
