package com.qq.qcloud.tencent_im_sdk_plugin.manager;

import com.qq.qcloud.tencent_im_sdk_plugin.util.CommonUtil;
import com.tencent.imsdk.v2.V2TIMCallback;
import com.tencent.imsdk.v2.V2TIMConversation;
import com.tencent.imsdk.v2.V2TIMConversationListener;
import com.tencent.imsdk.v2.V2TIMConversationResult;
import com.tencent.imsdk.v2.V2TIMManager;
import com.tencent.imsdk.v2.V2TIMValueCallback;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ConversationManager {
    private static MethodChannel channel;
    public ConversationManager(MethodChannel _channel){
        ConversationManager.channel = _channel;
    }

    public  void setConversationListener(MethodCall methodCall, final MethodChannel.Result result){
        V2TIMManager.getConversationManager().setConversationListener(new V2TIMConversationListener() {
            @Override
            public void onSyncServerStart() {
                makeConversationListenerEventData("onSyncServerStart",null);
            }

            @Override
            public void onSyncServerFinish() {
                makeConversationListenerEventData("onSyncServerFinish",null);
            }

            @Override
            public void onSyncServerFailed() {
                makeConversationListenerEventData("onSyncServerFailed",null);
            }

            @Override
            public void onNewConversation(List<V2TIMConversation> conversationList) {
                LinkedList<Object> list = new LinkedList<Object>();
                for(int i = 0;i<conversationList.size();i++){
                    list.add(CommonUtil.convertV2TIMConversationToMap(conversationList.get(i)));
                }
                makeConversationListenerEventData("onNewConversation",list);
            }

            @Override
            public void onConversationChanged(List<V2TIMConversation> conversationList) {
                LinkedList<Object> list = new LinkedList<Object>();
                for(int i = 0;i<conversationList.size();i++){
                    list.add(CommonUtil.convertV2TIMConversationToMap(conversationList.get(i)));
                }
                makeConversationListenerEventData("onConversationChanged",list);
            }
        });
    }
    public  void  getConversation(MethodCall methodCall,final  MethodChannel.Result result){
        String conversationID = CommonUtil.getParam(methodCall,result,"conversationID");
        V2TIMManager.getConversationManager().getConversation(conversationID, new V2TIMValueCallback<V2TIMConversation>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMConversation v2TIMConversation) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMConversationToMap(v2TIMConversation));
            }
        });
    }
    private <T> void  makeConversationListenerEventData(String type,T data){
        CommonUtil.emitEvent(ConversationManager.channel,"conversationListener",type,data);
    }
    public void getConversationList(MethodCall methodCall, final MethodChannel.Result result){
        int nextSeq = CommonUtil.getParam(methodCall,result,"nextSeq");
        int count = CommonUtil.getParam(methodCall,result,"count");
        V2TIMManager.getConversationManager().getConversationList(new Double(nextSeq).longValue(), count, new V2TIMValueCallback<V2TIMConversationResult>() {
            @Override
            public void onError(int i, String s) {
                CommonUtil.returnError(result,i,s);
            }

            @Override
            public void onSuccess(V2TIMConversationResult v2TIMConversationResult) {
                CommonUtil.returnSuccess(result,CommonUtil.convertV2TIMConversationResultToMap(v2TIMConversationResult));
            }
        });
    }
    public void deleteConversation(MethodCall methodCall, final MethodChannel.Result result) {
        // 会话ID
        String conversationID = CommonUtil.getParam(methodCall, result, "conversationID");
        V2TIMManager.getConversationManager().deleteConversation(conversationID, new V2TIMCallback() {
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
    public void setConversationDraft(MethodCall methodCall, final MethodChannel.Result result) {
        // 会话ID
        String conversationID = CommonUtil.getParam(methodCall, result, "conversationID");
        String draftText = CommonUtil.getParam(methodCall, result, "draftText");
        if(draftText==""){
            draftText = null;
        }
        V2TIMManager.getConversationManager().setConversationDraft(conversationID,draftText, new V2TIMCallback() {
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
}
