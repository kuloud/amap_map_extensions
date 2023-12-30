import 'package:amap_map/amap_map.dart';
import 'package:flutter/services.dart';

import 'amap_map_extensions_platform_interface.dart';

class AMapMapExtensions extends AMapExtension {
  MethodChannel? _channel;

  @override
  bindMethodChannel(MethodChannel channel) {
    return _channel = channel;
  }

  Future<String?> getAMapVersion() {
    return AMapMapExtensionsPlatform.instance.getAMapVersion();
  }

  // 需要 onMapCreated 以后调用
  Future<String?> getMapContentApprovalNumber() {
    return _channel?.invokeMethod<String>('map#contentApprovalNumber') ??
        Future(() => null);
  }

  // 需要 onMapCreated 以后调用
  Future<String?> getSatelliteImageApprovalNumber() {
    return _channel?.invokeMethod<String>('map#satelliteImageApprovalNumber') ??
        Future(() => null);
  }

  // 需要 onMapCreated 以后调用
  Future<void> setRenderFps(int fps) {
    return _channel?.invokeMethod<void>('map#setRenderFps', <String, dynamic>{
          'fps': fps,
        }) ??
        Future(() => null);
  }
}
