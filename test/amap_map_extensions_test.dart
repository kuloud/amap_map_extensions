import 'package:flutter_test/flutter_test.dart';
import 'package:amap_map_extensions/amap_map_extensions.dart';
import 'package:amap_map_extensions/amap_map_extensions_platform_interface.dart';
import 'package:amap_map_extensions/amap_map_extensions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAmapMapExtensionsPlatform
    with MockPlatformInterfaceMixin
    implements AmapMapExtensionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AmapMapExtensionsPlatform initialPlatform = AmapMapExtensionsPlatform.instance;

  test('$MethodChannelAmapMapExtensions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAmapMapExtensions>());
  });

  test('getPlatformVersion', () async {
    AmapMapExtensions amapMapExtensionsPlugin = AmapMapExtensions();
    MockAmapMapExtensionsPlatform fakePlatform = MockAmapMapExtensionsPlatform();
    AmapMapExtensionsPlatform.instance = fakePlatform;

    expect(await amapMapExtensionsPlugin.getPlatformVersion(), '42');
  });
}
