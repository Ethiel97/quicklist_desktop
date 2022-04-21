import 'package:flutter/cupertino.dart';
import 'package:flutter_desktop_2/providers/app_controller.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class Startup {
  static run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    // Use it only after calling `hiddenWindowAtLaunch`
    windowManager.waitUntilReadyToShow().then((_) async {
      // Hide window title bar
      // await windowManager.setTitleBarStyle(TitleBarStyle.normal);
      await windowManager.setMinimumSize(const Size(1000, 600));
      await windowManager.setTitle("Quicklist");
      await windowManager.center();
      await windowManager.show();
      // await windowManager.setSkipTaskbar(false);
    });
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
  }
}
