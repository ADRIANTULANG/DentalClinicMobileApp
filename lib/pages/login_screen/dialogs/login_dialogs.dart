import 'package:dcams/constant/color_class.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../client_registration_screen/view/client_registration_view.dart';
import '../../clinic_registration_screen/view/clinic_registration_view.dart';

class LoginDialog {
  static showDialogSignup() {
    Get.dialog(AlertDialog(
      content: Container(
        height: 12.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register as",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 90.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.to(() => ClientRegistrationView());
                    },
                    child: Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Client",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.sp),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.to(() => ClinicRegistrationView());
                    },
                    child: Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Clinic",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.sp),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
