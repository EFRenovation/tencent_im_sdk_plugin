import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tencent_im_sdk_plugin/enum/log_level.dart';
import 'package:tencent_im_sdk_plugin/models/v2_tim_value_callback.dart';
import 'package:tencent_im_sdk_plugin/tencent_im_sdk_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('tencent_im_sdk_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      var a = Map<String, dynamic>();
      a['data'] = true;
      return a;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  void initListener(data) {
    print(data.type);
  }

  test('init', () async {
    V2TimValueCallback<bool> res =
        await TencentImSDKPlugin.v2TIMManager.initSDK(
      sdkAppID: 1400187352,
      loglevel: LogLevel.V2TIM_LOG_ERROR,
      listener: initListener,
    );
    expect(true, res.data);
  });
}
