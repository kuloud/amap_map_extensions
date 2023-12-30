import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'amap_map_extensions_method_channel.dart';

abstract class AmapMapExtensionsPlatform extends PlatformInterface {
  /// Constructs a AmapMapExtensionsPlatform.
  AmapMapExtensionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AmapMapExtensionsPlatform _instance = MethodChannelAmapMapExtensions();

  /// The default instance of [AmapMapExtensionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAmapMapExtensions].
  static AmapMapExtensionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AmapMapExtensionsPlatform] when
  /// they register themselves.
  static set instance(AmapMapExtensionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getAMapVersion() {
    throw UnimplementedError('getAMapVersion() has not been implemented.');
  }

  // 获取地图审图号（普通地图）
  Future<String?> getMapContentApprovalNumber() {
    throw UnimplementedError(
        'getMapContentApprovalNumber() has not been implemented.');
  }

  // 获取地图审图号（卫星地图）
  Future<String?> getSatelliteImageApprovalNumber() {
    throw UnimplementedError(
        'getSatelliteImageApprovalNumber() has not been implemented.');
  }

  // 设置地图每秒渲染的帧数
  Future<String?> setRenderFps(int fps) {
    throw UnimplementedError('setRenderFps() has not been implemented.');
  }
}
