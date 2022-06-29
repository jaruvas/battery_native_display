import 'package:flutter/services.dart';

import 'utils.dart';

class ChannelService {
  static const _channel = MethodChannel('samples.flutter.dev/battery');
  static const _event = EventChannel('samples.flutter.dev/getRandomNumber');
  static const _eventConnectivity =
      EventChannel('samples.flutter.dev/connectivity');

  // Get battery level.
  static Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      batteryLevel = result.toString();
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }

  // Show dialog.
  static onShowNativeDialog() async {
    try {
      await _channel.invokeMethod('showAlertDialog');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Stream<int> get getRandomNumberStream {
    return _event.receiveBroadcastStream().cast();
  }

  static Stream<Connection> get getConnectivity {
    return _eventConnectivity
        .receiveBroadcastStream()
        .distinct()
        .map((dynamic event) => intToConnection(event as int));
  }
}
