import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'amap_map_extensions_platform_interface.dart';

/// An implementation of [AmapMapExtensionsPlatform] that uses method channels.
class MethodChannelAmapMapExtensions extends AmapMapExtensionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('amap_map_extensions');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
