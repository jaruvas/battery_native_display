import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                                    binaryMessenger: controller.binaryMessenger)
      batteryChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // This method is invoked on the UI thread.
          if (call.method == "getBatteryLevel") {
              self?.receiveBatteryLevel(result: result)
          } else if (call.method == "showAlertDialog") {
              DispatchQueue.main.async {
                let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
            }
          } else {
          result(FlutterMethodNotImplemented)
          return
        }
      })
    
      let randomNumberChannel = FlutterEventChannel(name: "samples.flutter.dev/getRandomNumber", binaryMessenger: controller.binaryMessenger)
      let randomNumberStreamHandler = RandomNumberStreamHandler()
          randomNumberChannel.setStreamHandler(randomNumberStreamHandler)
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery info unavailable",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
}


