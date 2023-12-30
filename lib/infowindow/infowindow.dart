import 'dart:io';

import 'package:amap_map_extensions/infowindow/infowindow_controller.dart';
import 'package:flutter/material.dart';
import 'package:x_amap_base/x_amap_base.dart';

/// A stateful widget responsible to create widget based custom info window.
class CustomInfoWindow extends StatefulWidget {
  /// A [InfoWindowController] to manipulate [CustomInfoWindow] state.
  final InfoWindowController controller;

  /// Offset to maintain space between [Marker] and [CustomInfoWindow].
  final double offset;

  /// Height of [CustomInfoWindow].
  final double height;

  /// Width of [CustomInfoWindow].
  final double width;

  final Function(double top, double left, double width, double height) onChange;

  const CustomInfoWindow(
    this.onChange, {
    required this.controller,
    this.offset = 50,
    this.height = 50,
    this.width = 100,
  })  : assert(offset >= 0),
        assert(height >= 0),
        assert(width >= 0);

  @override
  _CustomInfoWindowState createState() => _CustomInfoWindowState();
}

class _CustomInfoWindowState extends State<CustomInfoWindow> {
  bool _showNow = false;
  double _leftMargin = 0;
  double _topMargin = 0;
  Widget? _child;
  LatLng? _latLng;

  @override
  void initState() {
    super.initState();
    widget.controller.addInfoWindow = _addInfoWindow;
    widget.controller.onCameraMove = _onCameraMove;
    widget.controller.hideInfoWindow = _hideInfoWindow;
    widget.controller.showInfoWindow = _showInfoWindow;
  }

  /// Calculate the position on [CustomInfoWindow] and redraw on screen.
  void _updateInfoWindow() async {
    if (_latLng == null ||
        _child == null ||
        widget.controller.aMapController == null) {
      return;
    }
    // ScreenCoordinate screenCoordinate =
    //     await widget.controller.aMapController!.getScreenCoordinate(_latLng!);
    // double devicePixelRatio =
    //     Platform.isAndroid ? MediaQuery.of(context).devicePixelRatio : 1.0;
    // double left =
    //     (screenCoordinate.x.toDouble() / devicePixelRatio) - (widget.width / 2);
    // double top = (screenCoordinate.y.toDouble() / devicePixelRatio) -
    //     (widget.offset + widget.height);
    // setState(() {
    //   _showNow = true;
    //   _leftMargin = left;
    //   _topMargin = top;
    // });
    // widget.onChange.call(top, left, widget.width, widget.height);
  }

  /// Assign the [Widget] and [Marker]'s [LatLng].
  void _addInfoWindow(Widget child, LatLng latLng) {
    _child = child;
    _latLng = latLng;
    _updateInfoWindow();
  }

  /// Notifies camera movements on [GoogleMap].
  void _onCameraMove() {
    if (!_showNow) return;
    _updateInfoWindow();
  }

  /// Disables [CustomInfoWindow] visibility.
  void _hideInfoWindow() {
    setState(() {
      _showNow = false;
    });
  }

  /// Enables [CustomInfoWindow] visibility.
  void _showInfoWindow() {
    _updateInfoWindow();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _leftMargin,
      top: _topMargin,
      child: Visibility(
        visible: (_showNow == false ||
                (_leftMargin == 0 && _topMargin == 0) ||
                _child == null ||
                _latLng == null)
            ? false
            : true,
        child: Container(
          child: _child,
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }
}
