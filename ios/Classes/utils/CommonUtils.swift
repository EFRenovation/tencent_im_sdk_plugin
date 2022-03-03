import Flutter

//  通用工具类
public class CommonUtils {
    /**
     * 通用方法，获得参数值，如未找到参数，则直接中断
     *
     * @param methodCall 方法调用对象
     * @param result     返回对象
     * @param param      参数名
     */
    public static func getParam(call: FlutterMethodCall, result: @escaping FlutterResult, param: String) -> Any? {
        let value = (call.arguments as! [String: Any])[param];
        if value == nil {
            result(
                    FlutterError(code: "5", message: "Missing parameter", details: "Cannot find parameter `\(param)` or `\(param)` is null!")
            );
        }
        return value
    }

    /// 将hex string 转为Data
    public static func dataWithHexString(hex: String) -> Data {
        var hex = hex
        var data = Data()
        while (hex.count > 0) {
            let index1 = hex.index(hex.startIndex, offsetBy: 2)
            let index2 = hex.index(hex.endIndex, offsetBy: 0)
            let c: String = String(hex[hex.startIndex..<index1])
            hex = String(hex[index1..<index2])
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }
        return data
    }

    // 存在则赋值
    public static func getRequestInstance(call: FlutterMethodCall, instance: NSObject) -> NSObject {
      for item in call.arguments as! [String: Any] {
        if item.value != nil {
          instance.setValue(item.value, forKey: item.key)
        }
      }
      return instance
    }

    // 返回失败结果
	public static func resultFailed(desc: String? = "failed", code: Int32? = 0, call: FlutterMethodCall, result: @escaping FlutterResult) {
	  let res = ["code": code, "desc": desc] as [String : Any]
	  
      TencentImSDKPlugin.channel?.invokeMethod("logFromSwift", arguments: ["msg": "Swift Error，方法名\(call.method)，错误信息：", "data": desc])
      result(res)
    }

    // 返回成功结果
	public static func resultSuccess(desc: String = "ok", call: FlutterMethodCall, result: @escaping FlutterResult, data: Any = NSNull()) {
		let res = ["code": 0, "desc": desc, "data": data] as [String : Any]
		
		TencentImSDKPlugin.channel?.invokeMethod(
			"logFromSwift",
			arguments: [
				"msg": "Swift Response，方法名\(call.method)，数据：", "data": res
		])
        result(res)
    }

    public static func logFromSwift(channel: FlutterMethodChannel, data: Any) {
      channel.invokeMethod("logFromSwift", arguments: data);
    }
	
//	public static func requestNotificationPermissions() {
//		let center = UNUserNotificationCenter.current()
//		let application = UIApplication.shared
//
//		var options = [UNAuthorizationOptions]()
//		
//		options.append(.sound)
//		options.append(.badge)
//		options.append(.alert)
//		
//		let optionsUnion = UNAuthorizationOptions(options)
//		
//		center.requestAuthorization(options: optionsUnion) { (granted, error) in
//			if let error = error {
//				return
//			}
//			
//			center.getNotificationSettings { (settings) in
//				let map = [
//					"sound": settings.soundSetting == .enabled,
//					"badge": settings.badgeSetting == .enabled,
//					"alert": settings.alertSetting == .enabled
//				]
//			}
//		}
//		application.registerForRemoteNotifications()
//	}



}


//extension UNNotificationActionOptions {
//	static let stringToValue: [String: UNNotificationActionOptions] = {
//		var r: [String: UNNotificationActionOptions] = [:]
//		r["UNNotificationActionOptions.authenticationRequired"] = .authenticationRequired
//		r["UNNotificationActionOptions.destructive"] = .destructive
//		r["UNNotificationActionOptions.foreground"] = .foreground
//		return r
//	}()
//}

extension Data {
	var hexString: String {
		let hexString = map { String(format: "%02.2hhx", $0) }.joined()
		return hexString
	}
}
