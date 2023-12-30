import 'package:flutter_test/flutter_test.dart';
import 'package:amap_map_extensions/amap_map_extensions.dart';
import 'package:amap_map_extensions/amap_map_extensions_platform_interface.dart';
import 'package:amap_map_extensions/amap_map_extensions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAMapMapExtensionsPlatform
    with MockPlatformInterfaceMixin
    implements AMapMapExtensionsPlatform {
  @override
  Future<String?> getAMapVersion() => Future.value('42');
}

void main() {
  final AMapMapExtensionsPlatform initialPlatform =
      AMapMapExtensionsPlatform.instance;

  test('$MethodChannelAMapMapExtensions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAMapMapExtensions>());
  });

  test('getAMapVersion', () async {
    AMapMapExtensions amapMapExtensionsPlugin = AMapMapExtensions();
    MockAMapMapExtensionsPlatform fakePlatform =
        MockAMapMapExtensionsPlatform();
    AMapMapExtensionsPlatform.instance = fakePlatform;

    expect(await amapMapExtensionsPlugin.getAMapVersion(), '42');
  });
}
