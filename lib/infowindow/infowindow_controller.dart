import 'dart:ui';

import 'package:amap_map/amap_map.dart';
import 'package:flutter/material.dart';
import 'package:x_amap_base/x_amap_base.dart';

class InfoWindowController extends AMapExtension {
  /// Add custom [Widget] and [Marker]'s [LatLng] to [CustomInfoWindow] and make it visible.
  Function(Widget, LatLng)? addInfoWindow;

  /// Notifies [CustomInfoWindow] to redraw as per change in position.
  VoidCallback? onCameraMove;

  /// Hides [CustomInfoWindow].
  VoidCallback? hideInfoWindow;

  /// Shows [CustomInfoWindow].
  VoidCallback? showInfoWindow;

  AMapController? aMapController;

  @override
  void onDispose() {
    addInfoWindow = null;
    onCameraMove = null;
    hideInfoWindow = null;
    showInfoWindow = null;
    aMapController = null;
    super.onDispose();
  }
}
