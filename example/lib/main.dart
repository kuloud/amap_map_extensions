import 'package:amap_map/amap_map.dart';
import 'package:amap_map_extensions_example/const_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:amap_map_extensions/amap_map_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _mapContentApprovalNumber = 'Unknown';
  String _satelliteImageApprovalNumber = 'Unknown';

  final _amapMapExtensionsPlugin = AMapMapExtensions();

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _amapMapExtensionsPlugin.getAMapVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> getApprovalNumber() async {
    String satelliteImageApprovalNumber;
    String mapContentApprovalNumber;
    try {
      mapContentApprovalNumber =
          await _amapMapExtensionsPlugin.getMapContentApprovalNumber() ??
              'Unknown Approval Number';
      satelliteImageApprovalNumber =
          await _amapMapExtensionsPlugin.getSatelliteImageApprovalNumber() ??
              'Unknown Satellite Approval Number';
    } on PlatformException {
      mapContentApprovalNumber = 'Failed to get Approval Number.';
      satelliteImageApprovalNumber = 'Failed to get Satellite Approval Number.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mapContentApprovalNumber = mapContentApprovalNumber;
      _satelliteImageApprovalNumber = satelliteImageApprovalNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    AMapInitializer.init(context, ConstConfig.amapApiKeys);
    AMapInitializer.updatePrivacyAgree(ConstConfig.amapPrivacyStatement);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: AMapWidget(
                onMapCreated: (controller) {
                  getApprovalNumber();
                  _amapMapExtensionsPlugin.setRenderFps(25);
                },
                extensions: [_amapMapExtensionsPlugin],
              ),
            ),
            Text('Running on: $_platformVersion\n'),
            Text('Map Content Approval Number: $_mapContentApprovalNumber\n'),
            Text('Satellite Approval Number: $_satelliteImageApprovalNumber\n')
          ]),
        ),
      ),
    );
  }
}
