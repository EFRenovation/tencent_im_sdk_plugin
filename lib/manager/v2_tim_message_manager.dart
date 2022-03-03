import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tencent_im_sdk_plugin/enum/history_message_get_type.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';

///提供高级消息处理相关接口
///
/// [addAdvancedMsgListener] 添加高级消息的事件监听器
///
/// [removeAdvancedMsgListener] 移除高级消息监听器
///
/// [sendCustomMessage] 创建自定义消息
///
/// [sendImageMessage] 创建图片消息（图片最大支持 28 MB）
///
/// [sendSoundMessage] 创建语音消息（语音最大支持 28 MB）
///
/// [sendVideoMessage] 创建视频消息（视频最大支持 100 MB）
///
/// [sendVideoMessage] 创建文件消息（文件最大支持 100 MB）
///
/// [getC2CHistoryMessageList] 获取单聊历史消息
///
/// [getGroupHistoryMessageList] 获取群组历史消息
///
/// [getHistoryMessageList] 获取历史消息高级接口
///
/// [revokeMessage] 撤回消息
///
/// [markC2CMessageAsRead] 设置单聊消息已读
///
/// [markGroupMessageAsRead] 设置群组消息已读
///
/// [deleteMessageFromLocalStorage] 删除本地消息
///
/// [deleteMessages] 删除本地及漫游消息
///
///{@category Manager}
///
class V2TIMMessageManager {
  ///@nodoc
  late MethodChannel _channel;

  ///@nodoc
  Set advancedMsgListener = new Set();

  ///@nodoc
  V2TIMMessageManager(channel) {
    this._channel = channel;
  }

  /// 添加高级消息的事件监听器
  ///
  void addAdvancedMsgListener({
    required Function listener,
  }) {
    advancedMsgListener.add(listener);
    _channel.invokeMethod("addAdvancedMsgListener", _buildParam({}));
  }

  /// 移除高级消息监听器
  ///
  void removeAdvancedMsgListener() {
    advancedMsgListener.clear();
    _channel.invokeMethod("removeAdvancedMsgListener", _buildParam({}));
  }

  ///发送图片消息
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendImageMessage(
      {required String imagePath,
      required String receiver,
      String? groupID,
      int priority = 0,
      bool onlineUserOnly = false}) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendImageMessage",
          _buildParam(
            {
              "imagePath": imagePath,
              "receiver": receiver,
              "groupID": groupID,
              "priority": priority,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  ///发送视频消息
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendVideoMessage({
    required String videoFilePath,
    required String receiver,
    required String type,
    String? snapshotPath,
    int? duration,
    String? groupID,
    int? priority,
    bool? onlineUserOnly,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendVideoMessage",
          _buildParam(
            {
              "videoFilePath": videoFilePath,
              "receiver": receiver,
              "snapshotPath": snapshotPath,
              "duration": duration,
              "type": type,
              "groupID": groupID,
              "priority": priority,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  ///发送自定义消息
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendTextMessage({
    required String text,
    required receiver,
    String? groupID,
    int? priority = 0,
    bool onlineUserOnly = false,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendTextMessage",
          _buildParam(
            {
              "text": text,
              "receiver": receiver,
              "groupID": groupID,
              "priority": priority,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  ///发送自定义消息
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendCustomMessage({
    required String data,
    required String receiver,
    String? groupID,
    int? priority = 0,
    String? desc = "",
    String? extension = "",
    bool onlineUserOnly = false,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendCustomMessage",
          _buildParam(
            {
              "data": data,
              "receiver": receiver,
              "groupID": groupID,
              "priority": priority,
              "desc": desc,
              "extension": extension,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  ///发送文件
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendFileMessage({
    required String filePath,
    required String fileName,
    required String receiver,
    String? groupID,
    int? priority = 0,
    bool onlineUserOnly = false,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendFileMessage",
          _buildParam(
            {
              "filePath": filePath,
              "fileName": fileName,
              "receiver": receiver,
              "groupID": groupID,
              "priority": priority,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  ///发送文件
  ///
  Future<V2TimValueCallback<V2TimMessage>> sendSoundMessage({
    required String soundPath,
    required String receiver,
    int? duration,
    String? groupID,
    int? priority,
    bool onlineUserOnly = false,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "sendSoundMessage",
          _buildParam(
            {
              "soundPath": soundPath,
              "receiver": receiver,
              "duration": duration,
              "groupID": groupID,
              "priority": priority,
              "onlineUserOnly": onlineUserOnly,
            },
          ),
        ),
      ),
    );
  }

  /// 获取单聊历史消息
  ///
  /// 参数
  ///
  /// ```
  /// count	拉取消息的个数，不宜太多，会影响消息拉取的速度，这里建议一次拉取 20 个
  /// lastMsg	获取消息的起始消息，如果传 null，起始消息为会话的最新消息
  /// ```
  ///
  /// 注意
  ///
  /// ```
  /// 如果 SDK 检测到没有网络，默认会直接返回本地数据
  /// ```
  ///
  Future<V2TimValueCallback<List<V2TimMessage>>> getC2CHistoryMessageList({
    required String userID,
    required int count,
    String? lastMsgID,
  }) async {
    return V2TimValueCallback<List<V2TimMessage>>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "getC2CHistoryMessageList",
          _buildParam(
            {
              "userID": userID,
              "count": count,
              "lastMsgID": lastMsgID,
            },
          ),
        ),
      ),
    );
  }

  /// 获取群组历史消息
  ///
  /// 参数
  ///
  /// ```
  /// count	拉取消息的个数，不宜太多，会影响消息拉取的速度，这里建议一次拉取 20 个
  /// lastMsg	获取消息的起始消息，如果传 null，起始消息为会话的最新消息
  /// ```
  ///
  /// 注意
  ///
  /// ```
  /// 如果 SDK 检测到没有网络，默认会直接返回本地数据
  /// 只有会议群（Meeting）才能拉取到进群前的历史消息，直播群（AVChatRoom）消息不存漫游和本地数据库，调用这个接口无效
  /// ```
  ///
  Future<V2TimValueCallback<List<V2TimMessage>>> getGroupHistoryMessageList({
    required String groupID,
    required int count,
    String? lastMsgID,
  }) async {
    return V2TimValueCallback<List<V2TimMessage>>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "getGroupHistoryMessageList",
          _buildParam(
            {
              "groupID": groupID,
              "count": count,
              "lastMsgID": lastMsgID,
            },
          ),
        ),
      ),
    );
  }

  /// 撤回消息
  ///
  /// 注意
  ///
  /// ```
  /// 撤回消息的时间限制默认 2 minutes，超过 2 minutes 的消息不能撤回，您也可以在 控制台（功能配置 -> 登录与消息 -> 消息撤回设置）自定义撤回时间限制。
  /// 仅支持单聊和群组中发送的普通消息，无法撤销 onlineUserOnly 为 true 即仅在线用户才能收到的消息，也无法撤销直播群（AVChatRoom）中的消息。
  /// 如果发送方撤回消息，已经收到消息的一方会收到 V2TIMAdvancedMsgListener -> onRecvMessageRevoked 回调。
  /// ```
  ///
  Future<V2TimCallback> revokeMessage({
    required String msgID,
  }) async {
    return V2TimCallback.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "revokeMessage",
          _buildParam(
            {
              "msgID": msgID,
            },
          ),
        ),
      ),
    );
  }

  ///设置单聊消息已读
  ///
  Future<V2TimCallback> markC2CMessageAsRead({
    required String userID,
  }) async {
    return V2TimCallback.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "markC2CMessageAsRead",
          _buildParam(
            {
              "userID": userID,
            },
          ),
        ),
      ),
    );
  }

  /// 获取历史消息高级接口
  ///
  /// 参数
  /// option	拉取消息选项设置，可以设置从云端、本地拉取更老或更新的消息
  ///
  /// 请注意：
  /// 如果设置为拉取云端消息，当 SDK 检测到没有网络，默认会直接返回本地数据
  /// 只有会议群（Meeting）才能拉取到进群前的历史消息，直播群（AVChatRoom）消息不存漫游和本地数据库，调用这个接口无效
  ///
  Future<V2TimValueCallback<List<V2TimMessage>>> getHistoryMessageList({
    int getType = HistoryMessageGetType.V2TIM_GET_LOCAL_OLDER_MSG,
    String? userID,
    String? groupID,
    required int count,
    String? lastMsgID,
  }) async {
    return V2TimValueCallback<List<V2TimMessage>>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "getHistoryMessageList",
          _buildParam(
            {
              "getType": getType,
              "userID": userID,
              "groupID": groupID,
              "count": count,
              "lastMsgID": lastMsgID,
            },
          ),
        ),
      ),
    );
  }

  /// 设置群组消息已读
  ///
  Future<V2TimCallback> markGroupMessageAsRead({
    required String groupID,
  }) async {
    return V2TimCallback.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "markGroupMessageAsRead",
          _buildParam(
            {
              "groupID": groupID,
            },
          ),
        ),
      ),
    );
  }

  /// 删除本地消息
  ///
  /// 注意
  ///
  /// ```
  /// 消息只能本地删除，消息删除后，SDK 会在本地把这条消息标记为已删除状态，getHistoryMessage 不能再拉取到， 但是如果程序卸载重装，本地会失去对这条消息的删除标记，getHistoryMessage 还能再拉取到该条消息。
  /// ```
  ///
  Future<V2TimCallback> deleteMessageFromLocalStorage({
    required String msgID,
  }) async {
    return V2TimCallback.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "deleteMessageFromLocalStorage",
          _buildParam(
            {
              "msgID": msgID,
            },
          ),
        ),
      ),
    );
  }

  /// 删除本地及漫游消息
  ///
  /// 注意
  ///
  /// ```
  ///该接口会删除本地历史的同时也会把漫游消息即保存在服务器上的消息也删除，卸载重装后无法再拉取到。需要注意的是：
  ///   一次最多只能删除 30 条消息
  ///   要删除的消息必须属于同一会话
  ///   一秒钟最多只能调用一次该接口
  ///   如果该账号在其他设备上拉取过这些消息，那么调用该接口删除后，这些消息仍然会保存在那些设备上，即删除消息不支持多端同步。
  /// ```
  ///
  Future<V2TimCallback> deleteMessages({
    required List<String> msgIDs,
  }) async {
    return V2TimCallback.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "deleteMessages",
          _buildParam(
            {
              "msgIDs": msgIDs,
            },
          ),
        ),
      ),
    );
  }

  ///向群组消息列表中添加一条消息
  ///
  ///该接口主要用于满足向群组聊天会话中插入一些提示性消息的需求，比如“您已经退出该群”，这类消息有展示 在聊天消息区的需求，但并没有发送给其他人的必要。 所以 insertGroupMessageToLocalStorage() 相当于一个被禁用了网络发送能力的 sendMessage() 接口。
  ///
  ///返回[V2TimMessage]
  ///
  ///通过该接口 save 的消息只存本地，程序卸载后会丢失。
  ///
  Future<V2TimValueCallback<V2TimMessage>> insertGroupMessageToLocalStorage({
    required String data,
    required String groupID,
    required String sender,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "insertGroupMessageToLocalStorage",
          _buildParam(
            {
              "data": data,
              "groupID": groupID,
              "sender": sender,
            },
          ),
        ),
      ),
    );
  }

  ///向C2C消息列表中添加一条消息
  ///
  ///该接口主要用于满足向C2C聊天会话中插入一些提示性消息的需求，比如“您已成功发送消息”，这类消息有展示 在聊天消息区的需求，但并没有发送给其他人的必要。 所以 insertC2CMessageToLocalStorage() 相当于一个被禁用了网络发送能力的 sendMessage() 接口。
  ///
  ///返回[V2TimMessage]
  ///
  ///通过该接口 save 的消息只存本地，程序卸载后会丢失。
  ///
  Future<V2TimValueCallback<V2TimMessage>> insertC2CMessageToLocalStorage({
    required String data,
    required String userID,
    required String sender,
  }) async {
    return V2TimValueCallback<V2TimMessage>.fromJson(
      _formatJson(
        await _channel.invokeMethod(
          "insertC2CMessageToLocalStorage",
          _buildParam(
            {
              "data": data,
              "userID": userID,
              "sender": sender,
            },
          ),
        ),
      ),
    );
  }

  ///@nodoc
  Map _buildParam(Map param) {
    param["TIMManagerName"] = "messageManager";
    return param;
  }

  ///@nodoc
  _formatJson(jsonSrc) {
    return json.decode(json.encode(jsonSrc));
  }
}
