import 'package:battery_native_display/services/channel_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BatteryController extends GetxController {
  RxString batteryLevel = 'unknow level'.obs;
  
  getBatteryLevel() async {
    try {
      batteryLevel(await ChannelService.getBatteryLevel());
    } on PlatformException {
      batteryLevel('Failed to get platform version.');
    }
  }

  showDialog() async {
    await ChannelService.onShowNativeDialog();
  }

  getRandomNumberStream() {
    return ChannelService.getRandomNumberStream;
  }

  getConnectivity() {
    return ChannelService.getConnectivity;
  }
}
