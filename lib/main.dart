import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zendo_mobile/app/data/models/user.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await initServices();

  runApp(mainApp());
}

DevicePreview mainApp() {
  return DevicePreview(
    enabled: true,
    builder: (_) => ScreenUtilInit(
      designSize: Size(418, 823),
      builder: (_) {
        // Set Orientation
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        return GetMaterialApp(
          title: "Zendo",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
}

Future<void> initServices() async {
  print('starting services...');
  await Get.putAsync(() => DbService().init());
  print('All services started...');
}
