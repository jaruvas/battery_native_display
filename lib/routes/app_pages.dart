import 'package:get/route_manager.dart';

import '../modules/battery/binding/battery_binding.dart';
import '../modules/battery/view/battery_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.battery,
      page: () => const BatteryView(),
      binding: BatteryBinding(),
    ),
  ];
}
