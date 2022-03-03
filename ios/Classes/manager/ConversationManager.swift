//
//  ConversationManager.swift
//  tencent_im_sdk_plugin
//
//  Created by 林智 on 2020/12/24.
//

import Foundation
import ImSDK_Smart

class ConversationManager {
	var channel: FlutterMethodChannel
	
	init(channel: FlutterMethodChannel) {
		self.channel = channel
	}

	//MARK: -Conversation
	public func getConversationList(call: FlutterMethodCall, result: @escaping FlutterResult) {
		if let nextSeq = CommonUtils.getParam(call: call, result: result, param: "nextSeq") as? UInt64,
		   let count = CommonUtils.getParam(call: call, result: result, param: "count") as? Int32 {
			V2TIMManager.sharedInstance().getConversationList(nextSeq, count: count, succ: {
				conversations, nextSeq, finished in
				
				let dict = V2ConversationResultEntity.init(conversations: conversations!, nextSeq: nextSeq, finished: finished).getDict();
				CommonUtils.resultSuccess(call: call, result: result, data: dict);
			}, fail: TencentImUtils.returnErrorClosures(call: call, result: result))
		}
	}
	
	public func getConversation(call: FlutterMethodCall, result: @escaping FlutterResult) {
		if let conversationID = CommonUtils.getParam(call: call, result: result, param: "conversationID") as? String {
			V2TIMManager.sharedInstance().getConversation(conversationID, succ: {
				conversation in
				
				CommonUtils.resultSuccess(call: call, result: result, data: V2ConversationEntity.getDict(info: conversation!));
			}, fail: TencentImUtils.returnErrorClosures(call: call, result: result))
		}
	}
	
	public func deleteConversation(call: FlutterMethodCall, result: @escaping FlutterResult) {
		let conversationID = CommonUtils.getParam(call: call, result: result, param: "conversationID") as! String;
		
		V2TIMManager.sharedInstance()?.deleteConversation(conversationID, succ: {
			() -> Void in
			
			CommonUtils.resultSuccess(call: call, result: result)
		}, fail: TencentImUtils.returnErrorClosures(call: call, result: result));
	}
	
	public func setConversationDraft(call: FlutterMethodCall, result: @escaping FlutterResult) {
		let conversationID = CommonUtils.getParam(call: call, result: result, param: "conversationID") as! String;
		let draftText = CommonUtils.getParam(call: call, result: result, param: "draftText") as! String;
		
		V2TIMManager.sharedInstance()?.setConversationDraft(conversationID, draftText: draftText, succ: {
			() -> Void in
			
			CommonUtils.resultSuccess(call: call, result: result)
		}, fail: TencentImUtils.returnErrorClosures(call: call, result: result));
	}
	
	

}
