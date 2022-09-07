import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/location_services.dart';
import 'package:dcams/services/notification_services.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'pages/splash_screen/view/splashscreen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await GetStorage.init();
  await Get.put(NotificationServices());
  await Get.put(StorageServices());
  await Get.put(LocationServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DCAMS',
        theme: ThemeData(
          primarySwatch: AppColor.mainColors,
        ),
        home: SplashScreenView(),
      );
    });
  }
}
