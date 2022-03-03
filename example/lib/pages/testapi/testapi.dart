import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tencent_im_sdk_plugin/enum/friend_type.dart';
import 'package:tencent_im_sdk_plugin/enum/group_add_opt_type.dart';
import 'package:tencent_im_sdk_plugin/enum/log_level.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_check_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_group.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_operation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_full_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_operation_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message_progress.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_application.dart';

import 'package:tencent_im_sdk_plugin/models/v2_tim_friend_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_application_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_message_receipt.dart';
import 'package:tencent_im_sdk_plugin/tencent_im_sdk_plugin.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';

import 'package:tencent_im_sdk_plugin/models/v2_tim_event_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_user_full_info.dart';
import 'package:tencent_im_sdk_plugin_example/common/colors.dart';

import 'package:tencent_im_sdk_plugin_example/pages/home/home.dart';
import 'package:tencent_im_sdk_plugin_example/provider/conversion.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_conversation.dart';
import 'package:tencent_im_sdk_plugin_example/provider/currentMessageList.dart';
import 'package:tencent_im_sdk_plugin_example/provider/friend.dart';
import 'package:tencent_im_sdk_plugin_example/provider/friendApplication.dart';
import 'package:tencent_im_sdk_plugin_example/provider/groupApplication.dart';
import 'package:tencent_im_sdk_plugin_example/provider/user.dart';
import 'package:toast/toast.dart';

class TestApi extends StatefulWidget {
  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  void initState() {
    super.initState();
    // initSDK();
    // tologin();
  }

  listener(V2TimEventCallback data) async {}
  simpleMsgListener(V2TimEventCallback data) async {
    print("simpleMsgListener trigger");
  }

  groupListener(V2TimEventCallback data) async {}
  advancedMsgListener(V2TimEventCallback data) async {
    print("advancedMsgListener trigger");
  }

  friendListener(V2TimEventCallback data) async {}
  conversationListener(V2TimEventCallback data) async {}
  signalingListener(V2TimEventCallback data) async {}

  initSDK() async {
    await TencentImSDKPlugin.v2TIMManager.initSDK(
      sdkAppID: 0,
      loglevel: LogLevel.V2TIM_LOG_ERROR,
      listener: listener,
    );

    print("initSDK2");

    //简单监听
    // TencentImSDKPlugin.v2TIMManager.addSimpleMsgListener(
    //   listener: simpleMsgListener,
    // );

    // //群组监听
    // TencentImSDKPlugin.v2TIMManager.setGroupListener(
    //   listener: groupListener,
    // );
    // //高级消息监听
    // TencentImSDKPlugin.v2TIMManager.getMessageManager().addAdvancedMsgListener(
    //       listener: advancedMsgListener,
    //     );
    // //关系链监听
    // TencentImSDKPlugin.v2TIMManager.getFriendshipManager().setFriendListener(
    //       listener: friendListener,
    //     );
    // //会话监听
    // TencentImSDKPlugin.v2TIMManager
    //     .getConversationManager()
    //     .setConversationListener(
    //       listener: conversationListener,
    //     );
    // TencentImSDKPlugin.v2TIMManager.getSignalingManager().addSignalingListener(
    //       listener: signalingListener,
    //     );
    print("初始化完成了");
  }

  tologin() async {
  }

  // getJoinedGroupList() async {
  //   V2TimValueCallback<List<V2TimGroupInfo>> res =
  //     await TencentImSDKPlugin.v2TIMManager.getGroupManager().getJoinedGroupList();
  //   print(res.toJson());
  // }
  unInitSDK() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager.unInitSDK();
    print(res.toJson());
  }

  setSeflInfo() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .setSelfInfo(userID: "lexuslin3", customInfo: {"Str": "111"});
    print(res.toJson());
  }

  getHistoryMessageList() async {
    V2TimValueCallback<List<V2TimMessage>> res = await TencentImSDKPlugin
        .v2TIMManager
        .getMessageManager()
        .getHistoryMessageList(
          userID: null,
          groupID: "p1116",
          // getType: 1,
          count: 20,
          lastMsgID: null
        );
    print(res.desc);
  }

  getGroupAttr() async {
    V2TimValueCallback<Map<String, String>> data = await TencentImSDKPlugin
        .v2TIMManager
        .getGroupManager()
        .getGroupAttributes(
          groupID: "@TGS#aOJS2IAHA",
          keys: null,
        );
    print(data.data['test']);
    print(data.code);
    // print(data.toJson());
  }

  join1Group() async {
    V2TimCallback data = await TencentImSDKPlugin.v2TIMManager.joinGroup(
      groupID: "@TGS#aOD7NMCHA",
      message: "hahah",
    );
    print(data.toJson());
  }

  intGroupAttr() async {
    Map<String, String> attr = new Map<String, String>();
    attr["test"] = "hahhhh";
    V2TimCallback data = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .initGroupAttributes(
          groupID: "@TGS#aOJS2IAHA",
          attributes: attr,
        );
    print(data.toJson());
  }

  getVersion() async {
    V2TimValueCallback<String> res =
        await TencentImSDKPlugin.v2TIMManager.getVersion();
    print(res.toJson());
  }

  getServerTime() async {
    V2TimValueCallback<int> res =
        await TencentImSDKPlugin.v2TIMManager.getServerTime();
    print(res.toJson());
  }

  getLoginStatus() async {
    V2TimValueCallback<int> res =
        await TencentImSDKPlugin.v2TIMManager.getLoginStatus();
    print(res.toJson());
  }

  sendC2CCustomMessage() async {
    V2TimValueCallback<V2TimMessage> data =
        await TencentImSDKPlugin.v2TIMManager.sendC2CCustomMessage(
      customData: "test",
      userID: "85308",
    );
    print(data.data.toJson());
  }

  sendCustomMessage() async {
    var res = await TencentImSDKPlugin.v2TIMManager
      .getMessageManager()
      .sendCustomMessage(
        data: "111",
        receiver: null,
        groupID: "p1116",
        // desc: "xxx",
        // extension: "xxx2"
      );
    print(res.data.customElem.toJson());
  }

  sendTextMessage() async {
    V2TimValueCallback<V2TimMessage> data = await TencentImSDKPlugin.v2TIMManager
      .getMessageManager()
      .sendTextMessage(
        text: "test",
        receiver: "lexuslin3",
      );
    print(data.data.toJson());
  }

  removeSimpleMsgListener() async {
    TencentImSDKPlugin.v2TIMManager.removeSimpleMsgListener();
  }

  addSimpleMsgListener() async {
    TencentImSDKPlugin.v2TIMManager.addSimpleMsgListener(
      listener: simpleMsgListener,
    );
  }

  removeAdvancedMsgListener() async {
    TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .removeAdvancedMsgListener();
  }

  addAdvancedMsgListener() async {
    TencentImSDKPlugin.v2TIMManager.getMessageManager().addAdvancedMsgListener(
          listener: advancedMsgListener,
        );
  }

  dismissGroup() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .dismissGroup(groupID: "@TGS#2Z5J252GW");
    print(res.toJson());
  }

  getUsersInfo() async {
    V2TimValueCallback<List<V2TimUserFullInfo>> res = await TencentImSDKPlugin
        .v2TIMManager
        .getUsersInfo(userIDList: ["XPointer"]);
    print(res.data[0].customInfo["Tag_Profile_Custom_Str"]);
  }

  getGroupsInfo() async {
    V2TimValueCallback<List<V2TimGroupInfoResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getGroupManager()
            .getGroupsInfo(groupIDList: ["p111695"]);
    print(res.data[0].groupInfo.toJson());
  }

  setGroupInfo() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setGroupInfo(
            groupID: "p111695",
            // groupName: "xxxx33311",
            // faceUrl: "xxx.comxxx.cn22",
            isAllMuted: true,
            // notification: "123",
            // addOpt: GroupAddOptType.V2TIM_GROUP_ADD_FORBID,
            customInfo: {"group_info1": "1111"}
        );
    print(res.toJson());
  }

  // 0接收且推送，1不接收，2在线接收离线不推送
  setReceiveMessageOpt() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setReceiveMessageOpt(groupID: "@TGS#2DWCNB3GH", opt: 0);
    print(res.toJson());
  }

  createGroup() async {
    List<Map> newlist = new List<Map>();
    Map user = new Map();
    user['userID'] = "lexuslin";
    user['role'] = 200;
    newlist.add(user);
    V2TimValueCallback<String> res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .createGroup(
            groupID: "p1121235122343",
            groupName: "p1121",
            groupType: "Public",
            faceUrl:
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
            addOpt: GroupAddOptType.V2TIM_GROUP_ADD_ANY,
            memberList: newlist);
    print(res.toJson());
  }

  createGroupSimple() async {
    V2TimValueCallback<String> res = await TencentImSDKPlugin.v2TIMManager
        .createGroup(
            groupID: "p112153", groupName: "p1121", groupType: "Public");
    print(res.toJson());
  }

  sendGroupTextMessage() async {
    V2TimValueCallback<V2TimMessage> res = await TencentImSDKPlugin.v2TIMManager
        .sendGroupTextMessage(text: "111", groupID: "zblexus", priority: 1);

    print(res.toJson());
  }

  joinGroup() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .joinGroup(groupID: "zblexus", message: "1");
    print(res.toJson());
  }

  quitGroup() async {
    V2TimCallback res =
        await TencentImSDKPlugin.v2TIMManager.quitGroup(groupID: "p1116");
    print(res.toJson());
  }

  

  // 仅支持AVChatRoom
  initGroupAttributes() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .initGroupAttributes(
            groupID: "testavchatroom2", attributes: {"a": "1", "b": "2"});
    print(res.toJson());
  }

  setGroupAttributes() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setGroupAttributes(
            groupID: "testavchatroom2", attributes: {"a": "1222", "b": "2333"});
    print(res.toJson());
  }

  deleteGroupAttributes() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .deleteGroupAttributes(groupID: "testavchatroom2", keys: ["b"]);
    print(res.toJson());
  }

  getGroupAttributes() async {
    V2TimValueCallback<Map<String, String>> res = await TencentImSDKPlugin
        .v2TIMManager
        .getGroupManager()
        .getGroupAttributes(groupID: "testavchatroom2", keys: ["a", "b"]);
    print(res.toJson());
  }

  getGroupOnlineMemberCount() async {
    V2TimValueCallback<int> res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .getGroupOnlineMemberCount(groupID: "p111695");
    print(res.toJson());
  }

  getGroupMembersInfo() async {
    V2TimValueCallback<List<V2TimGroupMemberFullInfo>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getGroupManager()
            .getGroupMembersInfo(
                groupID: "p111695", memberList: ["lexuslin3", "lexuslin"]);
    print(res.toJson());
  }

  setGroupMemberInfo() async {
    Map<String, String> customInfo = new Map();
    customInfo['group_member_p'] = "1111";
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setGroupMemberInfo(
            groupID: "p111695",
            userID: "lexuslin3",
            nameCard: "aaaaa2233",
            customInfo: customInfo);
    print(res.toJson());
  }

  muteGroupMember() async {
    V2TimCallback res =
        await TencentImSDKPlugin.v2TIMManager.getGroupManager().muteGroupMember(
              groupID: "@TGS#2DWCNB3GH",
              userID: "lexuslin3",
              seconds: 600,
            );
    print(res.toJson());
  }

  inviteUserToGroup() async {
    V2TimValueCallback<List<V2TimGroupMemberOperationResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getGroupManager()
            .inviteUserToGroup(
                groupID: "@TGS#1ZBXOB3G5", userList: ["lexuslin2"]);
    print(res.toJson());
  }

  kickGroupMember() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .kickGroupMember(
            groupID: "p112123512234", memberList: ["lexuslin"], reason: "你不太行");
    print(res.toJson());
  }

  // 200成员，300管理员，400群主
  setGroupMemberRole() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setGroupMemberRole(
            groupID: "p11212344", userID: "lexuslin", role: 200);
    print(res.toJson());
  }

  transferGroupOwner() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .transferGroupOwner(groupID: "@TGS#1ZBXOB3G5", userID: "lexuslin3");
    print(res.toJson());
  }

  setGroupApplicationRead() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getGroupManager()
        .setGroupApplicationRead();
    print(res.toJson());
  }

  setFriendInfo() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .setFriendInfo(
            userID: "13675", friendCustomInfo: {"Str222": "22223334"});
    print(res.toJson());
  }

  getFriendsInfo() async {
    V2TimValueCallback<List<V2TimFriendInfoResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .getFriendsInfo(userIDList: ["13675"]);
    print(res.data[0].friendInfo.toJson());
  }

  checkFriend() async {
    List<String> userIDList = ["lexuslin", "13675"];
    V2TimValueCallback<List<V2TimFriendCheckResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .checkFriend(userIDList, FriendType.V2TIM_FRIEND_TYPE_BOTH);
    print(res.toJson());
  }

  addFriend() async {
    V2TimValueCallback<V2TimFriendOperationResult> res =
        await TencentImSDKPlugin.v2TIMManager.getFriendshipManager().addFriend(
            userID: "lexuslin2",
            remark: "xxx",
            addSource: "AddSource_Type_Android",
            addType: 1);
    print(res.toJson().data);
  }

  // type?
  deleteFriendApplication() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .deleteFriendApplication(userID: "lexuslin3", type: 1);
    print(res.toJson());
  }

  setFriendApplicationRead() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .setFriendApplicationRead();
    print(res.toJson());
  }

  createFriendGroup() async {
    V2TimValueCallback<List<V2TimFriendOperationResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .createFriendGroup(groupName: "group3", userIDList: ["lexuslin3"]);
    print(res.toJson());
  }

  // ios方法名，getFriendGroupList
  getFriendGroups() async {
    V2TimValueCallback<List<V2TimFriendGroup>> res = await TencentImSDKPlugin
        .v2TIMManager
        .getFriendshipManager()
        .getFriendGroups(groupNameList: ["xx222"]);
    print(res.toJson());
  }

  deleteFriendGroup() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .deleteFriendGroup(groupNameList: ["group2"]);
    print(res.toJson());
  }

  renameFriendGroup() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getFriendshipManager()
        .renameFriendGroup(oldName: "group3", newName: "group3new222");
    print(res.toJson());
  }

  addFriendsToFriendGroup() async {
    V2TimValueCallback<List<V2TimFriendOperationResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .addFriendsToFriendGroup(
                groupName: "group3new222", userIDList: ["lexuslin2"]);
    print(res.toJson());
  }

  deleteFriendsFromFriendGroup() async {
    V2TimValueCallback<List<V2TimFriendOperationResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getFriendshipManager()
            .deleteFriendsFromFriendGroup(
                groupName: "group3new222", userIDList: ["lexuslin3"]);
    print(res.toJson());
  }

  setConversationDraft() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getConversationManager()
        .setConversationDraft(conversationID: "ccccc111", draftText: "会话草稿1");
    print(res.toJson());
  }

  revokeMessage() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .revokeMessage(msgID: "144115225971632901-1607914832-2133922461");
    print(res.toJson());
  }

  deleteMessageFromLocalStorage() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .deleteMessageFromLocalStorage(
            msgID: "144115225971632901-1608635550-1824306931");
    print(res.toJson());
  }

  deleteMessages() async {
    List<String> list = new List<String>();
    list.add("144115225971632901-1607682284-904218793");
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .deleteMessages(msgIDs: list);
    print(res.toJson());
  }

  insertGroupMessageToLocalStorage() async {
    V2TimValueCallback<V2TimMessage> res = await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .insertGroupMessageToLocalStorage(
            groupID: "g1234", sender: "13675", data: "mmmmmm2");
    print(res.toJson());
  }

  insertC2CMessageToLocalStorage() async {
    V2TimValueCallback<V2TimMessage> res = await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .insertC2CMessageToLocalStorage(
          data: "111test",
          userID: "lexuslin",
          sender: "13675",
        );

    print(res.toJson());
  }

  addSignalingListener() async {
    TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .addSignalingListener(listener: signalingListener);
  }

  removeSignalingListener() async {
    TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .removeSignalingListener(listener: signalingListener);
  }

  invite() async {
    V2TimValueCallback<String> res =
        await TencentImSDKPlugin.v2TIMManager.getSignalingManager().invite(
              invitee: "lexuslin3",
              data: "hahah",
              timeout: 15,
              onlineUserOnly: false,
            );
    print(res.toJson());
  }

  inviteInGroup() async {
    V2TimValueCallback<String> res = await TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .inviteInGroup(
            groupID: "p112123512",
            inviteeList: ["lexuslin3"],
            data: "xxx",
            timeout: 600,
            onlineUserOnly: false);
    print(res.toJson());
  }

  cancel() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .cancel(inviteID: "5e1ebce95422f55b5eed3eeb0041f5d3", data: "xxx");
    print(res.toJson());
  }

  accept() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .accept(inviteID: "9006ee71328f686091f80f117ba099da", data: "xxx");
    print(res.toJson());
  }

  reject() async {
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
        .getSignalingManager()
        .reject(inviteID: "9006ee71328f686091f80f117ba099da", data: "xxx");
    print(res.toJson());
  }

  getSignallingInfo() async {
    // V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
    //     .getSignalingManager()
    //     .getSignallingInfo(
    //         invitee: "lexuslin3",
    //         data: "xxx",
    //         timeout: 15,
    //         onlineUserOnly: true
    //     );
    // print(res.toJson());
  }

  addInvitedSignaling() async {
    // V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
    //     .getSignalingManager()
    //     .addInvitedSignaling(
    //         invitee: "lexuslin3",
    //         data: "xxx",
    //         timeout: 15,
    //         onlineUserOnly: true
    //     );
    // print(res.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试页"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) => new Column(
            children: [
              Text("Manager"),
              RaisedButton(
                onPressed: getHistoryMessageList,
                child: Text("getHistoryMessageList"),
              ),
              RaisedButton(
                onPressed: unInitSDK,
                child: Text("unInitSDK"),
              ),
              RaisedButton(
                onPressed: join1Group,
                child: Text("join1Group"),
              ),
              RaisedButton(
                onPressed: intGroupAttr,
                child: Text("intGroupAttr"),
              ),
              RaisedButton(
                onPressed: getGroupAttr,
                child: Text("getGroupAttr"),
              ),
              RaisedButton(
                onPressed: getVersion,
                child: Text("getVersion"),
              ),
              RaisedButton(
                onPressed: getServerTime,
                child: Text("getServerTime"),
              ),
              RaisedButton(
                onPressed: getLoginStatus,
                child: Text("getLoginStatus"),
              ),
              RaisedButton(
                onPressed: sendC2CCustomMessage,
                child: Text("sendC2CCustomMessage"),
              ),
              RaisedButton(
                onPressed: invite,
                child: Text("invite"),
              ),
              RaisedButton(
                onPressed: addSimpleMsgListener,
                child: Text("addSimpleMsgListener"),
              ),
              RaisedButton(
                onPressed: removeSimpleMsgListener,
                child: Text("removeSimpleMsgListener"),
              ),
              RaisedButton(
                onPressed: addAdvancedMsgListener,
                child: Text("addAdvancedMsgListener"),
              ),
              RaisedButton(
                onPressed: removeAdvancedMsgListener,
                child: Text("removeAdvancedMsgListener"),
              ),
              RaisedButton(
                onPressed: dismissGroup,
                child: Text("dismissGroup"),
              ),
              RaisedButton(
                onPressed: setSeflInfo,
                child: Text("setSeflInfo"),
              ),
              RaisedButton(
                onPressed: getUsersInfo,
                child: Text("getUsersInfo"),
              ),
              RaisedButton(
                onPressed: createGroupSimple,
                child: Text("createGroup(简版)"),
              ),
              Text("Group"),
              RaisedButton(
                onPressed: getGroupsInfo,
                child: Text("getGroupsInfo"),
              ),
              RaisedButton(
                onPressed: setGroupInfo,
                child: Text("setGroupInfo"),
              ),
              RaisedButton(
                onPressed: setReceiveMessageOpt,
                child: Text("setReceiveMessageOpt"),
              ),
              RaisedButton(
                onPressed: createGroup,
                child: Text("createGroup(高级版)"),
              ),
              RaisedButton(
                onPressed: sendGroupTextMessage,
                child: Text("sendGroupTextMessage"),
              ),
              RaisedButton(
                onPressed: joinGroup,
                child: Text("joinGroup"),
              ),
              RaisedButton(
                onPressed: quitGroup,
                child: Text("quitGroup"),
              ),
              
              RaisedButton(
                onPressed: initGroupAttributes,
                child: Text("initGroupAttributes"),
              ),
              RaisedButton(
                onPressed: setGroupAttributes,
                child: Text("setGroupAttributes"),
              ),
              RaisedButton(
                onPressed: deleteGroupAttributes,
                child: Text("deleteGroupAttributes"),
              ),
              RaisedButton(
                onPressed: getGroupAttributes,
                child: Text("getGroupAttributes"),
              ),
              RaisedButton(
                onPressed: getGroupOnlineMemberCount,
                child: Text("getGroupOnlineMemberCount"),
              ),
              RaisedButton(
                onPressed: getGroupMembersInfo,
                child: Text("getGroupMembersInfo"),
              ),
              RaisedButton(
                onPressed: setGroupMemberInfo,
                child: Text("setGroupMemberInfo"),
              ),
              RaisedButton(
                onPressed: muteGroupMember,
                child: Text("muteGroupMember"),
              ),
              RaisedButton(
                onPressed: inviteUserToGroup,
                child: Text("inviteUserToGroup"),
              ),
              RaisedButton(
                onPressed: kickGroupMember,
                child: Text("kickGroupMember"),
              ),
              RaisedButton(
                onPressed: setGroupMemberRole,
                child: Text("setGroupMemberRole"),
              ),
              RaisedButton(
                onPressed: transferGroupOwner,
                child: Text("transferGroupOwner"),
              ),
              RaisedButton(
                onPressed: setGroupApplicationRead,
                child: Text("setGroupApplicationRead"),
              ),
              Text("Friend"),
              RaisedButton(
                onPressed: setFriendInfo,
                child: Text("setFriendInfo"),
              ),
              RaisedButton(
                onPressed: getFriendsInfo,
                child: Text("getFriendsInfo"),
              ),
              RaisedButton(
                onPressed: checkFriend,
                child: Text("checkFriend"),
              ),
              RaisedButton(
                onPressed: addFriend,
                child: Text("addFriend"),
              ),
              RaisedButton(
                onPressed: deleteFriendApplication,
                child: Text("deleteFriendApplication"),
              ),
              RaisedButton(
                onPressed: setFriendApplicationRead,
                child: Text("setFriendApplicationRead"),
              ),
              RaisedButton(
                onPressed: createFriendGroup,
                child: Text("createFriendGroup"),
              ),
              RaisedButton(
                onPressed: getFriendGroups,
                child: Text("getFriendGroups"),
              ),
              RaisedButton(
                onPressed: deleteFriendGroup,
                child: Text("deleteFriendGroup"),
              ),
              RaisedButton(
                onPressed: renameFriendGroup,
                child: Text("renameFriendGroup"),
              ),
              RaisedButton(
                onPressed: addFriendsToFriendGroup,
                child: Text("addFriendsToFriendGroup"),
              ),
              RaisedButton(
                onPressed: deleteFriendsFromFriendGroup,
                child: Text("deleteFriendsFromFriendGroup"),
              ),
              Text("Conversation"),
              RaisedButton(
                onPressed: setConversationDraft,
                child: Text("setConversationDraft"),
              ),
              Text("Message"),
              RaisedButton(
                onPressed: sendCustomMessage,
                child: Text("sendCustomMessage"),
              ),
              RaisedButton(
                onPressed: sendTextMessage,
                child: Text("sendTextMessage"),
              ),
              RaisedButton(
                onPressed: removeAdvancedMsgListener,
                child: Text("removeAdvancedMsgListener"),
              ),
              RaisedButton(
                onPressed: getHistoryMessageList,
                child: Text("getHistoryMessageList"),
              ),
              RaisedButton(
                onPressed: revokeMessage,
                child: Text("revokeMessage"),
              ),
              RaisedButton(
                onPressed: deleteMessageFromLocalStorage,
                child: Text("deleteMessageFromLocalStorage"),
              ),
              RaisedButton(
                onPressed: deleteMessages,
                child: Text("deleteMessages"),
              ),
              RaisedButton(
                onPressed: insertGroupMessageToLocalStorage,
                child: Text("insertGroupMessageToLocalStorage"),
              ),
              RaisedButton(
                onPressed: insertC2CMessageToLocalStorage,
                child: Text("insertC2CMessageToLocalStorage"),
              ),
              Text("Conversation"),
              RaisedButton(
                onPressed: addSignalingListener,
                child: Text("addSignalingListener"),
              ),
              RaisedButton(
                onPressed: removeSignalingListener,
                child: Text("removeSignalingListener"),
              ),
              RaisedButton(
                onPressed: invite,
                child: Text("invite"),
              ),
              RaisedButton(
                onPressed: inviteInGroup,
                child: Text("inviteInGroup"),
              ),
              RaisedButton(
                onPressed: cancel,
                child: Text("cancel"),
              ),
              RaisedButton(
                onPressed: accept,
                child: Text("accept"),
              ),
              RaisedButton(
                onPressed: reject,
                child: Text("reject"),
              ),
              RaisedButton(
                onPressed: getSignallingInfo,
                child: Text("getSignallingInfo(未实现)"),
              ),
              RaisedButton(
                onPressed: addInvitedSignaling,
                child: Text("addInvitedSignaling(未实现)"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
