import 'package:caredent/care_dent_app.dart';
import 'package:caredent/core/di/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  runApp( const CareDent());
  // DevicePreview(enabled: true, builder: (context) =>
}
