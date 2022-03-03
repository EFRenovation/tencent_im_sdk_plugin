package com.qq.qcloud.tencent_im_sdk_plugin.manager;

import com.qq.qcloud.tencent_im_sdk_plugin.util.CommonUtil;
import com.tencent.imsdk.v2.V2TIMAdvancedMsgListener;
import com.tencent.imsdk.v2.V2TIMCallback;
import com.tencent.imsdk.v2.V2TIMManager;
import com.tencent.imsdk.v2.V2TIMMessage;
import com.tencent.imsdk.v2.V2TIMMessageListGetOption;
import com.tencent.imsdk.v2.V2TIMMessageManager;
import com.tencent.imsdk.v2.V2TIMMessageReceipt;
import com.tencent.imsdk.v2.V2TIMOfflinePushInfo;
import com.tencent.imsdk.v2.V2TIMSendCallback;
import com.tencent.imsdk.v2.V2TIMValueCallback;
//import com.tencent.imsdk.v2.V2TIMMessageListGetOption;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;



public class MessageManager {
    private static MethodChannel channel;
    private static V2TIMMessageManager manager;
    private static V2TIMAdvancedMsgListener advacedMessageListener;//暂时只能有一个listener

    public MessageManager(MethodChannel _channel){
        MessageManager.channel = _channel;
        MessageManager.manager = V2TIMManager.getMessageManager();
    }


    public void  addAdvancedMsgListener(MethodCall call,final MethodChannel.Result result){
        advacedMessageListener = new V2TIMAdvancedMsgListener() {
            @Override
            public void onRecvNewMessage(V2TIMMessage msg) {
                makeAddAdvancedMsgListenerEventData("onRecvNewMessage",CommonUtil.convertV2TIMMessageToMap(msg));
            }

            @Override
            public void onRecvC2CReadReceipt(List<V2TIMMessageReceipt> receiptList) {
                List<Object> list = new LinkedList<Object>();
                for(int i = 0;i<receiptList.size();i++){
                    list.add(CommonUtil.convertV2TIMMessageReceiptToMap(receiptList.get(i)));
                }
                makeAddAdvancedMsgListenerEventData("onRecvC2CReadReceipt",list);
            }

            @Override
            public void onRecvMessageRevoked(String msgID) {
                makeAddAdvancedMsgListenerEventData("onRecvMessageRevoked",msgID);
            }
        };
        V2TIMManager.getMessageManager().addAdvancedMsgListener(advacedMessageListener);
    }

    public void removeAdvancedMsgListener(MethodCall call,final MethodChannel.Result result){
        if(advacedMessageListener == null){
            result.error("-1","no listener",null);
        }else{
            V2TIMManager.getMessageManager().removeAdvancedMsgListener(advacedMessageListener);
            result.success(null);
        }
    }
    private <T> void  makeAddAdvancedMsgListenerEventData(String type,T data){
        CommonUtil.emitEvent(MessageManager.channel,"advancedMsgListener",type,data);
    }

    private <T> T getMapValue(HashMap<String,T> map,String key){
        T value =  map.get(key);
        return value;
    }

    public  void  sendTextMessage(MethodCall methodCall, final MethodChannel.Result result){
        String message = CommonUtil.getParam(methodCall,result,"text");
        String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        int priority = CommonUtil.getParam(methodCall,result,"priority");
        boolean onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createTextMessage(message);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendCustomMessage(MethodCall methodCall, final MethodChannel.Result result){
        String data = CommonUtil.getParam(methodCall,result,"data");
        String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        String desc = CommonUtil.getParam(methodCall,result,"desc");
        String extension = CommonUtil.getParam(methodCall,result,"extension");
        int priority;
        if(CommonUtil.getParam(methodCall,result,"priority") == null){
            priority = 0;
        }else {
            priority = CommonUtil.getParam(methodCall,result,"priority");
        }
        boolean onlineUserOnly ;
        if(CommonUtil.getParam(methodCall,result,"onlineUserOnly") == null){
            onlineUserOnly = false;
        }else{
            onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        }
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
       final V2TIMMessage msg =  mannager.createCustomMessage(data.getBytes(), desc, extension.getBytes());

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendImageMessage(MethodCall methodCall, final MethodChannel.Result result){
        String imagePath = CommonUtil.getParam(methodCall,result,"imagePath");
         String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");

        int priority;
        if(CommonUtil.getParam(methodCall,result,"priority")==null){
            priority = 0;
        }else{
            priority  = CommonUtil.getParam(methodCall,result,"priority");
        }
        boolean onlineUserOnly;
        if(CommonUtil.getParam(methodCall,result,"onlineUserOnly")==null){
            onlineUserOnly = true;
        }else{
            onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        }
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createImageMessage(imagePath);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendSoundMessage(MethodCall methodCall, final MethodChannel.Result result){
        String soundPath = CommonUtil.getParam(methodCall,result,"soundPath");
        int duration = 0;
        if(CommonUtil.getParam(methodCall,result,"duration") != null){
            duration = CommonUtil.getParam(methodCall,result,"duration");
        }
         String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        int priority;
        if(CommonUtil.getParam(methodCall,result,"priority")==null){
            priority = 0;
        }else{
            priority  = CommonUtil.getParam(methodCall,result,"priority");
        }
        boolean onlineUserOnly;
        if(CommonUtil.getParam(methodCall,result,"onlineUserOnly")==null){
            onlineUserOnly = false;
        }else{
            onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        }
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createSoundMessage(soundPath,duration);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly,new V2TIMOfflinePushInfo(), new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendVideoMessage(MethodCall methodCall, final MethodChannel.Result result){
        String videoFilePath = CommonUtil.getParam(methodCall,result,"videoFilePath");
        String type = CommonUtil.getParam(methodCall,result,"type");
        String snapshotPath = CommonUtil.getParam(methodCall,result,"snapshotPath");
        int duration;
         String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        if(CommonUtil.getParam(methodCall,result,"duration") == null){
            duration = 0;
        }else{
            duration   = CommonUtil.getParam(methodCall,result,"duration");
        }
        int priority;
        if(CommonUtil.getParam(methodCall,result,"priority")==null){
            priority = 0;
        }else{
            priority  = CommonUtil.getParam(methodCall,result,"priority");
        }
        boolean onlineUserOnly;
        if(CommonUtil.getParam(methodCall,result,"onlineUserOnly")==null){
            onlineUserOnly = false;
        }else{
            onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        }


        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createVideoMessage(videoFilePath,type,duration,snapshotPath);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendFileMessage(MethodCall methodCall, final MethodChannel.Result result){
        String filePath = CommonUtil.getParam(methodCall,result,"filePath");
        String fileName = CommonUtil.getParam(methodCall,result,"fileName");

         String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        int priority;
        if(CommonUtil.getParam(methodCall,result,"priority")==null){
            priority = 0;
        }else{
            priority = CommonUtil.getParam(methodCall,result,"priority");
        }
        boolean onlineUserOnly;
        if(CommonUtil.getParam(methodCall,result,"onlineUserOnly") == null){
            onlineUserOnly = true;
        }else{
            onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        }
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createFileMessage(filePath,fileName);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendLocationMessage(MethodCall methodCall, final MethodChannel.Result result){
        String desc = CommonUtil.getParam(methodCall,result,"desc");
        double longitude = CommonUtil.getParam(methodCall,result,"longitude");
        double latitude = CommonUtil.getParam(methodCall,result,"latitude");

        final  String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        int priority = CommonUtil.getParam(methodCall,result,"priority");
        boolean onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createLocationMessage(desc,longitude,latitude);

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);

            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public  void  sendFaceMessage(MethodCall methodCall, final MethodChannel.Result result){
        int index = CommonUtil.getParam(methodCall,result,"index");
        String data = CommonUtil.getParam(methodCall,result,"data");

         String receiver = CommonUtil.getParam(methodCall,result,"receiver");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        int priority = CommonUtil.getParam(methodCall,result,"priority");
        boolean onlineUserOnly = CommonUtil.getParam(methodCall,result,"onlineUserOnly");
        V2TIMOfflinePushInfo offlinePushInfo = new V2TIMOfflinePushInfo();
        V2TIMMessageManager mannager = V2TIMManager.getMessageManager();
        final V2TIMMessage msg =  mannager.createFaceMessage(index,data.getBytes());

        mannager.sendMessage(msg, receiver, groupID, priority, onlineUserOnly, offlinePushInfo, new V2TIMSendCallback<V2TIMMessage>() {
            @Override
            public void onProgress(int i) {
                HashMap<String,Object> data = new HashMap<String,Object>();
                data.put("message",CommonUtil.convertV2TIMMessageToMap(msg,i));
                data.put("progress",i);
                makeAddAdvancedMsgListenerEventData("onSendMessageProgress",data);
            }

            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });

    }
    public void getC2CHistoryMessageList(MethodCall methodCall, final MethodChannel.Result result){

       final int count = CommonUtil.getParam(methodCall,result,"count");
        final String userID = CommonUtil.getParam(methodCall,result,"userID");
        final String lastMsgID = CommonUtil.getParam(methodCall,result,"lastMsgID");
        final List<String> list = new LinkedList<String>();
        if(lastMsgID != null){
            list.add(lastMsgID);
        }
        if(list.size()>0){
            V2TIMManager.getMessageManager().findMessages(list, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onError(int i, String s) {
                    CommonUtil.returnError(result,i,s);
                }

                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    if(v2TIMMessages.size()>0){
                        V2TIMMessage msg = v2TIMMessages.get(0);
                        V2TIMManager.getMessageManager().getC2CHistoryMessageList(userID, count, msg, new V2TIMValueCallback<List<V2TIMMessage>>() {
                            @Override
                            public void onError(int i, String s) {
                                CommonUtil.returnError(result,i,s);
                            }

                            @Override
                            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                                LinkedList<Object> list = new LinkedList<Object>();
                                for(int i= 0;i<v2TIMMessages.size();i++){
                                    list.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                                }
                                CommonUtil.returnSuccess(result,list);
                            }
                        });
                    }else{
                        CommonUtil.returnError(result,-1,"message not found");
                    }
                }
            });
        }else{
            V2TIMManager.getMessageManager().getC2CHistoryMessageList(userID, count, null, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onError(int i, String s) {
                    CommonUtil.returnError(result,i,s);
                }

                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    LinkedList<Object> list = new LinkedList<Object>();
                    for(int i= 0;i<v2TIMMessages.size();i++){
                        list.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                    }
                    CommonUtil.returnSuccess(result,list);
                }
            });
        }

    }
    public void getGroupHistoryMessageList (MethodCall methodCall, final MethodChannel.Result result){
        final int count = CommonUtil.getParam(methodCall,result,"count");
        final String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        final String lastMsgID = CommonUtil.getParam(methodCall,result,"lastMsgID");
        final List<String> list = new LinkedList<String>();
        if(lastMsgID != null){
            list.add(lastMsgID);
        }
        if(list.size() > 0){
            V2TIMManager.getMessageManager().findMessages(list, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onError(int i, String s) {
                    CommonUtil.returnError(result,i,s);
                }

                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    if(v2TIMMessages.size()>0){
                        V2TIMManager.getMessageManager().getGroupHistoryMessageList(groupID, count, v2TIMMessages.get(0), new V2TIMValueCallback<List<V2TIMMessage>>() {
                            @Override
                            public void onError(int i, String s) {
                                CommonUtil.returnError(result,i,s);
                            }

                            @Override
                            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                                LinkedList<Object> list = new LinkedList<Object>();
                                for(int i= 0;i<v2TIMMessages.size();i++){
                                    list.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                                }
                                CommonUtil.returnSuccess(result,list);
                            }
                        });
                    }else{
                        CommonUtil.returnError(result,-1,"message not found");
                    }
                }
            });
        }else{
            V2TIMManager.getMessageManager().getGroupHistoryMessageList(groupID, count, null, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onError(int i, String s) {
                    CommonUtil.returnError(result,i,s);
                }

                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    LinkedList<Object> list = new LinkedList<Object>();
                    for(int i= 0;i<v2TIMMessages.size();i++){
                        list.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                    }
                    CommonUtil.returnSuccess(result,list);
                }
            });
        }
    }

    public void getHistoryMessageList(MethodCall methodCall, final MethodChannel.Result result){
        int getType = CommonUtil.getParam(methodCall,result,"getType");
        String userID = CommonUtil.getParam(methodCall,result,"userID");
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        String lastMsgID = CommonUtil.getParam(methodCall,result,"lastMsgID");
        int count  = CommonUtil.getParam(methodCall,result,"count");
        final V2TIMMessageListGetOption option = new V2TIMMessageListGetOption();
        option.setCount(count);
        option.setGetType(getType);
        if(groupID!=null){
            option.setGroupID(groupID);
        }
        if(userID!=null){
            option.setUserID(userID);
        }
        List<String> msglist =new  LinkedList<String>();
        if(lastMsgID!=null){
            msglist.add(lastMsgID);
            V2TIMManager.getMessageManager().findMessages(msglist, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    if(v2TIMMessages.size() == 1){
                        //找到了message
                        option.setLastMsg(v2TIMMessages.get(0));
                        V2TIMManager.getMessageManager().getHistoryMessageList(option, new V2TIMValueCallback<List<V2TIMMessage>>() {
                            @Override
                            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                                List<HashMap<String,Object>> msgs =new  LinkedList<HashMap<String,Object>>();
                                for(int i = 0;i<v2TIMMessages.size();i++){
                                    msgs.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                                }
                                CommonUtil.returnSuccess(result,msgs);
                            }

                            @Override
                            public void onError(int code, String desc) {
                                CommonUtil.returnError(result,code,desc);
                            }
                        });
                    }else{
                        CommonUtil.returnError(result,-1,"message not found");
                    }
                }

                @Override
                public void onError(int code, String desc) {
                    CommonUtil.returnError(result,code,desc);
                }
            });
        }else{
            V2TIMManager.getMessageManager().getHistoryMessageList(option, new V2TIMValueCallback<List<V2TIMMessage>>() {
                @Override
                public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                    List<HashMap<String,Object>> msgs =new  LinkedList<HashMap<String,Object>>();
                    for(int i = 0;i<v2TIMMessages.size();i++){
                        msgs.add(CommonUtil.convertV2TIMMessageToMap(v2TIMMessages.get(i)));
                    }
                    CommonUtil.returnSuccess(result,msgs);
                }

                @Override
                public void onError(int code, String desc) {
                    CommonUtil.returnError(result,code,desc);
                }
            });
        }
    }

    public void revokeMessage(MethodCall methodCall, final MethodChannel.Result result){
       final String msgID = CommonUtil.getParam(methodCall,result,"msgID");
        LinkedList<String> list = new LinkedList<>();
        list.add(msgID);
        V2TIMManager.getMessageManager().findMessages(list, new V2TIMValueCallback<List<V2TIMMessage>>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                if(v2TIMMessages.size()>0){
                    V2TIMManager.getMessageManager().revokeMessage(v2TIMMessages.get(0), new V2TIMCallback() {
                        @Override
                        public void onError(int i, String s) {
                            CommonUtil.returnError(result,i,s);
                        }

                        @Override
                        public void onSuccess() {
                            CommonUtil.returnSuccess(result,null);
                        }
                    });
                }else{
                    CommonUtil.returnError(result,-1,"messages not found");
                }
            }
        });

    }
    public void markC2CMessageAsRead(MethodCall methodCall, final MethodChannel.Result result){
        String userID = CommonUtil.getParam(methodCall,result,"userID");
        V2TIMManager.getMessageManager().markC2CMessageAsRead(userID, new V2TIMCallback() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess() {
                CommonUtil.returnSuccess(result,null);
            }
        });
    }
    public void markGroupMessageAsRead(MethodCall methodCall, final MethodChannel.Result result){
        String groupID = CommonUtil.getParam(methodCall,result,"groupID");
        V2TIMManager.getMessageManager().markGroupMessageAsRead(groupID, new V2TIMCallback() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess() {
                CommonUtil.returnSuccess(result,null);
            }
        });
    }
    public void deleteMessageFromLocalStorage(MethodCall methodCall, final MethodChannel.Result result){
        final String msgID = CommonUtil.getParam(methodCall,result,"msgID");
        LinkedList<String> list = new LinkedList<>();
        list.add(msgID);
        V2TIMManager.getMessageManager().findMessages(list, new V2TIMValueCallback<List<V2TIMMessage>>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                if(v2TIMMessages.size()>0){
                    V2TIMManager.getMessageManager().deleteMessageFromLocalStorage(v2TIMMessages.get(0), new V2TIMCallback() {
                        @Override
                        public void onError(int i, String s) {
                            CommonUtil.returnError(result,i,s);
                        }

                        @Override
                        public void onSuccess() {
                            CommonUtil.returnSuccess(result,null);
                        }
                    });
                }else{
                    CommonUtil.returnError(result,-1,"messages not found");
                }
            }
        });
    }
    public void deleteMessages(MethodCall methodCall, final MethodChannel.Result result){
        final List<String> msgIDs = CommonUtil.getParam(methodCall,result,"msgIDs");
        System.out.println("msgIDs"+msgIDs);
        V2TIMManager.getMessageManager().findMessages(msgIDs, new V2TIMValueCallback<List<V2TIMMessage>>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(List<V2TIMMessage> v2TIMMessages) {
                System.out.println("find 到了 message"+v2TIMMessages.size());
                if(v2TIMMessages.size()>0){
                    V2TIMManager.getMessageManager().deleteMessages(v2TIMMessages, new V2TIMCallback() {
                        @Override
                        public void onError(int i, String s) {
                            CommonUtil.returnError(result,i,s);
                        }

                        @Override
                        public void onSuccess() {
                            CommonUtil.returnSuccess(result,null);
                        }
                    });
                }else{
                    CommonUtil.returnError(result,-1,"messages not found");
                }
            }
        });
    }
    public void insertGroupMessageToLocalStorage(final MethodCall methodCall, final MethodChannel.Result result){
        final String data = CommonUtil.getParam(methodCall,result,"data");
        final String groupID= CommonUtil.getParam(methodCall,result,"groupID");
        final String sender= CommonUtil.getParam(methodCall,result,"sender");

        V2TIMMessageManager msgManager =  V2TIMManager.getInstance().getMessageManager();
        V2TIMMessage msg = msgManager.createCustomMessage(data.getBytes());

        V2TIMManager.getMessageManager().insertGroupMessageToLocalStorage(msg, groupID, sender, new V2TIMValueCallback<V2TIMMessage>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }
        });
    }
    public void insertC2CMessageToLocalStorage(final MethodCall methodCall, final MethodChannel.Result result){
        final String data = CommonUtil.getParam(methodCall,result,"data");
        final String userID =  CommonUtil.getParam(methodCall,result,"userID");
        final String sender= CommonUtil.getParam(methodCall,result,"sender");
        V2TIMMessageManager msgManager =  V2TIMManager.getInstance().getMessageManager();
        V2TIMMessage msg = msgManager.createCustomMessage(data.getBytes());
        msgManager.insertC2CMessageToLocalStorage(msg, userID, sender, new V2TIMValueCallback<V2TIMMessage>() {
            @Override
            public void onSuccess(V2TIMMessage v2TIMMessage) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMMessageToMap(v2TIMMessage));
            }

            @Override
            public void onError(int code, String desc) {
                CommonUtil.returnError(result,code,desc);
            }
        });

    }

}
