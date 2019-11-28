import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routers/routers.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    // 竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // 横屏
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) async {
    runApp(MyApp());
  });
}
