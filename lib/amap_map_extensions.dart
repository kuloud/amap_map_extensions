import 'amap_map_extensions_platform_interface.dart';

class AmapMapExtensions {
  Future<String?> getAMapVersion() {
    return AmapMapExtensionsPlatform.instance.getAMapVersion();
  }
}
