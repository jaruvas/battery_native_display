import 'package:battery_native_display/modules/battery/controller/battery_controller.dart';
import 'package:get/instance_manager.dart';

class BatteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BatteryController());
  }
}