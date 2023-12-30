import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'amap_map_extensions_platform_interface.dart';

/// An implementation of [AMapMapExtensionsPlatform] that uses method channels.
class MethodChannelAMapMapExtensions extends AMapMapExtensionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('amap_map_extensions');

  @override
  Future<String?> getAMapVersion() async {
    final version = await methodChannel.invokeMethod<String>('getAMapVersion');
    return version;
  }
}
