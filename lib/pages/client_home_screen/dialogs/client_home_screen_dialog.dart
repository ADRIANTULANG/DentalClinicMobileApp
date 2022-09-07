import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../login_screen/view/login_screen_view.dart';

class ClientHomeScreenDialog {
  static showLogoutDialog() {
    Get.dialog(AlertDialog(
      content: Container(
        height: 12.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Do you want to exit?",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 90.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 1.5,
                            fontSize: 15.sp),
                      )),
                  TextButton(
                      onPressed: () {
                        Get.find<StorageServices>().removeStorageCredentials();
                        Get.offAll(() => LoginScreenView());
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 1.5,
                            fontSize: 15.sp),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
