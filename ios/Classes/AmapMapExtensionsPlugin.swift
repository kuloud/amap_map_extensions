import Flutter
import UIKit
import MAMapKit

public class AMapMapExtensionsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "amap_map_extensions", binaryMessenger: registrar.messenger())
    let instance = AMapMapExtensionsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAMapVersion":
      result(MAMapKitVersion)
    case "getMapContentApprovalNumber":
      result(MAMapKitVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
