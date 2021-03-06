import 'package:flutter/material.dart';
import 'package:tencent_im_sdk_plugin/enum/group_member_filter_type.dart';
import 'package:tencent_im_sdk_plugin/enum/group_member_role.dart';
import 'package:tencent_im_sdk_plugin/enum/group_type.dart';
import 'package:tencent_im_sdk_plugin/enum/group_add_opt_type.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_callback.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_full_info.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_group_member_info_result.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';
import 'package:tencent_im_sdk_plugin/tencent_im_sdk_plugin.dart';
import 'package:tencent_im_sdk_plugin_example/common/avatar.dart';
import 'package:tencent_im_sdk_plugin_example/common/colors.dart';
import 'package:tencent_im_sdk_plugin_example/pages/allMembers/allMembers.dart';
import 'package:tencent_im_sdk_plugin_example/pages/contact/chooseContact.dart';

import 'package:tencent_im_sdk_plugin_example/pages/profile/component/groupProfilePanel.dart';
import 'package:tencent_im_sdk_plugin_example/pages/profile/component/listGap.dart';
import 'package:toast/toast.dart';

class ConversationInfo extends StatefulWidget {
  ConversationInfo(this.id, this.type);
  final String id;
  final int type;
  @override
  State<StatefulWidget> createState() {
    return ConversationInfoState();
  }
}

class GroupMemberProfileTitle extends StatelessWidget {
  GroupMemberProfileTitle(this.memberInfo, this.groupInfo);
  final V2TimGroupMemberInfoResult memberInfo;
  final V2TimGroupInfoResult groupInfo;

  @override
  Widget build(BuildContext context) {
    if (memberInfo == null || groupInfo == null) {
      return Container();
    }
    return Material(
      child: Ink(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => AllMembers(groupInfo),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CommonColors.getBorderColor(),
                  width: 1,
                ),
              ),
            ),
            height: 40,
            child: Row(
              children: [
                Text("?????????"),
                Expanded(child: Container()),
                Text("${groupInfo.groupInfo.memberCount}???"),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MemberListOverview extends StatelessWidget {
  MemberListOverview(this.memberInfo, this.groupInfo);
  final V2TimGroupMemberInfoResult memberInfo;
  final V2TimGroupInfoResult groupInfo;
  getShowName(V2TimGroupMemberFullInfo info) {
    String name = '';
    if (info.friendRemark != null && info.friendRemark != '') {
      name = info.friendRemark;
      return name;
    }
    if (info.nickName != null && info.nickName != '') {
      name = info.nickName;
      return name;
    }
    if (info.nameCard != null && info.nameCard != '') {
      name = info.nameCard;
      return name;
    }
    if (info.userID != null && info.userID != '') {
      name = info.userID;
      return name;
    }
    return name;
  }

  List<Widget> renderMember(context) {
    List<Widget> member = memberInfo.memberInfoList
        .sublist(
          0,
          memberInfo.memberInfoList.length > 5
              ? 5
              : memberInfo.memberInfoList.length,
        )
        .map(
          (e) => Container(
            child: Column(
              children: [
                Avatar(
                  width: 30,
                  height: 30,
                  avtarUrl: e.faceUrl == '' || e.faceUrl == null
                      ? 'images/logo.png'
                      : e.faceUrl,
                  radius: 2,
                ),
                Text(
                  getShowName(e),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        )
        .toList();
    // ????????????????????????????????????????????????
    if ((groupInfo.groupInfo.role ==
                GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_ADMIN ||
            groupInfo.groupInfo.role ==
                GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_OWNER) &&
        groupInfo.groupInfo.groupType == GroupType.Work) {
      member.add(
        Container(
          child: IconButton(
              icon: Icon(
                Icons.add_box,
                color: CommonColors.getTextWeakColor(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => ChooseContact(
                      6,
                      groupInfo.groupInfo.groupID,
                    ),
                  ),
                );
              }),
          width: 40,
          height: 40,
        ),
      );
    }
    return member;
  }

  @override
  Widget build(BuildContext context) {
    if (memberInfo == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: renderMember(context),
      ),
    );
  }
}

// add(
//               Container(
//                 child: Icon(Icons.add_alarm_outlined),
//                 width: 30,
//                 height: 30,
//               ),
//             )
class GroupMemberProfile extends StatelessWidget {
  GroupMemberProfile(this.memberInfo, this.groupInfo);
  final V2TimGroupMemberInfoResult memberInfo;
  final V2TimGroupInfoResult groupInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GroupMemberProfileTitle(memberInfo, groupInfo),
          MemberListOverview(memberInfo, groupInfo),
        ],
      ),
    );
  }
}

class GroupTypeAndAddInfo extends StatelessWidget {
  GroupTypeAndAddInfo(this.groupInfo);
  final V2TimGroupInfoResult groupInfo;
  getGroupType() {
    String name = '';
    if (groupInfo.groupInfo.groupType == GroupType.AVChatRoom) {
      name = '?????????';
    }
    if (groupInfo.groupInfo.groupType == GroupType.Meeting) {
      name = '???????????????';
    }
    if (groupInfo.groupInfo.groupType == GroupType.Public) {
      name = '??????????????????';
    }
    if (groupInfo.groupInfo.groupType == GroupType.Work) {
      name = '???????????????';
    }
    return name;
  }

  getAddType() {
    int type = groupInfo.groupInfo.groupAddOpt;
    String name = '';

    if (type == GroupAddOptType.V2TIM_GROUP_ADD_ANY) {
      name = '?????????????????????';
    }
    if (type == GroupAddOptType.V2TIM_GROUP_ADD_AUTH) {
      name = '?????????????????????';
    }
    if (type == GroupAddOptType.V2TIM_GROUP_ADD_FORBID) {
      name = '????????????';
    }
    return name;
  }

  getRoleType() {
    int type = groupInfo.groupInfo.role;
    String name = '';
    if (type == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_ADMIN) {
      name = '????????????';
    }
    if (type == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_MEMBER) {
      name = '?????????';
    }
    if (type == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_OWNER) {
      name = '??????';
    }
    if (type == GroupMemberRoleType.V2TIM_GROUP_MEMBER_UNDEFINED) {
      name = '????????????';
    }
    return name;
  }

  bool canDissmiss() {
    String groupType = groupInfo.groupInfo.groupType;
    int role = groupInfo.groupInfo.role;
    print(
        "groupType $groupType $role ${groupType != GroupType.Work} ${(groupType != GroupType.Work && (role == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_ADMIN || role == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_OWNER))}");
    return (groupType == GroupType.Work &&
            role == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_ADMIN) ||
        (groupType != GroupType.Work &&
            (role == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_ADMIN ||
                role == GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_OWNER));
  }

  Future<bool> showDeleteConfirmDialog(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("??????"),
          content: Text("??????????????????????????????????"),
          actions: <Widget>[
            FlatButton(
              child: Text("??????"),
              onPressed: () => Navigator.of(context).pop(), // ???????????????
            ),
            FlatButton(
              child: Text("??????"),
              onPressed: () {
                //????????????????????????true
                Navigator.of(context).pop();
                TencentImSDKPlugin.v2TIMManager
                    .dismissGroup(groupID: groupInfo.groupInfo.groupID)
                    .then((res) {
                  if (res.code == 0) {
                    Toast.show("??????????????????", context);
                    Navigator.of(context).pop();
                    //TODO????????????
                  } else {
                    Toast.show("??????????????????${res.code}  ${res.desc}", context);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget renderDismssGroup(context) {
    return canDissmiss()
        ? InkWell(
            onTap: () {
              showDeleteConfirmDialog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: CommonColors.getBorderColor(),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("????????????"),
                ],
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    if (groupInfo == null) {
      return Container();
    }

    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: CommonColors.getBorderColor(),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('?????????'),
                  Expanded(
                    child: Container(),
                  ),
                  Text(getRoleType())
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: CommonColors.getBorderColor(),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('?????????'),
                  Expanded(
                    child: Container(),
                  ),
                  Text(getGroupType())
                ],
              ),
            ),
          ),
          renderDismssGroup(context),
          InkWell(
            onTap: () {
              if (GroupType.Public != groupInfo.groupInfo.groupType) {
                Toast.show("???public???????????????????????????", context);
                return;
              }
              if (GroupMemberRoleType.V2TIM_GROUP_MEMBER_ROLE_MEMBER ==
                      groupInfo.groupInfo.role ||
                  GroupMemberRoleType.V2TIM_GROUP_MEMBER_UNDEFINED ==
                      groupInfo.groupInfo.role) {
                Toast.show("????????????????????????", context);
                return;
              }
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min, // ?????????????????????
                      children: <Widget>[
                        new ListTile(
                          title: new Text(
                            "?????????????????????",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: CommonColors.getThemeColor()),
                          ),
                          onTap: () async {
                            Navigator.of(context).pop();

                            TencentImSDKPlugin.v2TIMManager
                                .getGroupManager()
                                .setGroupInfo(
                                  groupID: groupInfo.groupInfo.groupID,
                                  addOpt: GroupAddOptType.V2TIM_GROUP_ADD_ANY,
                                )
                                .then((value) {
                              if (value.code == 0) {
                                Toast.show("????????????", context);
                                Navigator.pop(context);
                              } else {
                                Toast.show(
                                    "${value.code} ${value.desc}", context);
                              }
                            });
                          },
                        ),
                        new ListTile(
                          title: new Text(
                            "?????????????????????",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: CommonColors.getThemeColor()),
                          ),
                          onTap: () async {
                            Navigator.of(context).pop();
                            TencentImSDKPlugin.v2TIMManager
                                .getGroupManager()
                                .setGroupInfo(
                                  groupID: groupInfo.groupInfo.groupID,
                                  addOpt: GroupAddOptType.V2TIM_GROUP_ADD_AUTH,
                                )
                                .then((value) {
                              if (value.code == 0) {
                                Toast.show("????????????", context);
                                Navigator.pop(context);
                              } else {
                                Toast.show(
                                    "${value.code} ${value.desc}", context);
                              }
                            });
                          },
                        ),
                        new ListTile(
                          title: new Text(
                            "????????????",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: CommonColors.getThemeColor()),
                          ),
                          onTap: () async {
                            Navigator.of(context).pop();
                            TencentImSDKPlugin.v2TIMManager
                                .getGroupManager()
                                .setGroupInfo(
                                  groupID: groupInfo.groupInfo.groupID,
                                  addOpt:
                                      GroupAddOptType.V2TIM_GROUP_ADD_FORBID,
                                )
                                .then((value) {
                              if (value.code == 0) {
                                Toast.show("????????????", context);
                                Navigator.pop(context);
                              } else {
                                Toast.show(
                                    "${value.code} ${value.desc}", context);
                              }
                            });
                          },
                        )
                      ],
                    );
                  });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('????????????'),
                  Expanded(
                    child: Container(),
                  ),
                  Text(getAddType()),
                  Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExitGroup extends StatelessWidget {
  ExitGroup(this.groupInfo);
  final V2TimGroupInfoResult groupInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              color: CommonColors.getReadColor(),
              textColor: CommonColors.getWitheColor(),
              height: 40,
              onPressed: () async {
                // ??????????????????

                V2TimCallback res = await TencentImSDKPlugin.v2TIMManager
                    .quitGroup(groupID: groupInfo.groupInfo.groupID);
                V2TimCallback deleteRes = await TencentImSDKPlugin.v2TIMManager
                    .getConversationManager()
                    .deleteConversation(
                        conversationID: "group_${groupInfo.groupInfo.groupID}");
                if (res.code == 0) {
                  Toast.show("????????????", context);
                  if (deleteRes.code == 0) {
                    print("??????????????????");
                  } else {
                    print("?????????????????? ${deleteRes.code} ${deleteRes.desc}");
                  }
                  Navigator.pop(context);
                } else {
                  Toast.show("????????????${res.code} ${res.desc} ", context);
                }
              },
              child: Text("???????????????"),
            ),
          )
        ],
      ),
    );
  }
}

class ConversationInfoState extends State<ConversationInfo> {
  void initState() {
    this.id = widget.id;
    this.type = widget.type;
    print("????????????id ${this.id}");
    getDetail();
    super.initState();
  }

  String id;
  int type;
  V2TimGroupInfoResult groupInfo;
  V2TimGroupMemberInfoResult memberInfo;
  // ????????????????????????????????????
  getDetail() async {
    V2TimValueCallback<List<V2TimGroupInfoResult>> res =
        await TencentImSDKPlugin.v2TIMManager
            .getGroupManager()
            .getGroupsInfo(groupIDList: [id]);
    if (res.code == 0) {
      setState(() {
        groupInfo = res.data[0];
      });
    } else {
      Toast.show("????????????????????? ${res.code} ${res.desc}", context);
    }

    print("??????????????????${res.data[0].groupInfo.toJson()}");
    String groupID = res.data[0].groupInfo.groupID;
    V2TimValueCallback<V2TimGroupMemberInfoResult> list =
        await TencentImSDKPlugin.v2TIMManager
            .getGroupManager()
            .getGroupMemberList(
              groupID: groupID,
              filter: GroupMemberFilterType.V2TIM_GROUP_MEMBER_FILTER_ALL,
              nextSeq: 0, //????????????0?????????
            );
    if (list.code == 0) {
      print(
          "list.data.memberInfoList.length:${list.data.memberInfoList.length}");

      setState(() {
        groupInfo = res.data[0];
        memberInfo = list.data;
      });
    } else {
      Toast.show("??????????????????????????? ${list.code} ${list.desc}", context);
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.getThemeColor(),
        title: Text("????????????"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GroupProfilePanel(groupInfo),
            ListGap(),
            GroupMemberProfile(memberInfo, groupInfo),
            ListGap(),
            GroupTypeAndAddInfo(groupInfo),
            ListGap(),
            Expanded(
              child: Container(),
            ),
            ExitGroup(groupInfo)
          ],
        ),
      ),
    );
  }
}
