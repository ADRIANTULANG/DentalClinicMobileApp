import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../login_screen/view/login_screen_view.dart';
import '../controller/client_home_screen_controller.dart';

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

  static showDialogListOfKilometers(
      {required ClientHomeViewController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(5.w),
      content: Container(
        height: 15.h,
        width: 5.w,
        // color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Distance ",
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 15.h,
              width: 35.w,
              child: ListView.builder(
                itemCount: controller.kilometersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: InkWell(
                      onTap: () {
                        controller.isSelectedDistance.value =
                            controller.kilometersList[index].toString();
                        controller.getNearClinics(
                            distanceInKilometers:
                                controller.kilometersList[index].toString());
                        Get.back();
                      },
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            border: Border.all(color: Colors.grey)),
                        alignment: Alignment.center,
                        child: Text(
                          controller.kilometersList[index].toString() + " Km",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
