import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/utils.dart';
import '../controller/battery_controller.dart';

class BatteryView extends GetView<BatteryController> {
  const BatteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getBatteryLevel();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: controller.getRandomNumberStream(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Text("Current Random Number: ${snapshot.data}");
              } else {
                return const Text("Waiting for new random number...");
              }
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          StreamBuilder<Connection>(
            stream: controller.getConnectivity(),
            builder:
                (BuildContext context, AsyncSnapshot<Connection> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data?.name ?? Connection.unknown.name);
              } else {
                return Text(Connection.unknown.name);
              }
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          ObxValue<RxString>(
            (level) => Center(
              child: InkWell(
                onTap: () => controller.getBatteryLevel(),
                child: Text(
                  level.value,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            controller.batteryLevel,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Center(
            child: InkWell(
              onTap: () => controller.showDialog(),
              child: const Text(
                'Show dialog',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
