import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../dental_clinic_subscription_screen/view/dental_clinic_subscription_view.dart';
import '../../login_screen/view/login_screen_view.dart';
import '../controller/dental_clinic_home_screen_controller.dart';

class DentalClinicHomeScreenDialogs {
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

  static showDialogForRemarks(
      {required DentalClinicHomeScreenController controller,
      required String fcmToken,
      required String services,
      required String resID}) {
    Get.dialog(AlertDialog(
      content: Container(
        height: 27.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Remarks",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 14.h,
              width: 100.w,
              child: TextField(
                controller: controller.remarks,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                    fontSize: 11),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Reason',
                    hintText: 'Enter Reason',
                    alignLabelWithHint: true),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
                width: 100.w,
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      controller.rejectAppointments(
                          fcmToken: fcmToken,
                          services: services,
                          resID: resID,
                          remarks: controller.remarks.text);
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Colors.red,
                          fontSize: 9.sp),
                    ))),
          ],
        ),
      ),
    ));
  }

  static showReminder() {
    Get.dialog(AlertDialog(
      content: Container(
        height: 23.h,
        width: 100.w,
        child: Column(
          children: [
            Text(
              "Reminder",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Your dental account is currently inactive.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: 11.sp),
            ),
            Text(
              "Please subscribe to our system. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: 11.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
                width: 100.w,
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      Get.to(() => DentalClinicSubscriptionView());
                    },
                    child: Text(
                      "Subscribe now!",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Colors.red,
                          fontSize: 12.sp),
                    ))),
          ],
        ),
      ),
    ));
  }

  static showReminderForNotifications(
      {required String patientname,
      required String fcmToken,
      required String service,
      required DentalClinicHomeScreenController controller}) {
    TextEditingController message = TextEditingController();
    message.text =
        "Please be reminded that your next visit will be on '*please add time and date here'";
    Get.dialog(AlertDialog(
      content: Container(
        height: 30.h,
        width: 100.w,
        child: Column(
          children: [
            Text(
              "Reminder for $patientname",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              height: 16.h,
              width: 100.w,
              child: TextField(
                maxLines: 13,
                controller: message,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    letterSpacing: 1.5),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Enter reminder for the patient',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
                width: 100.w,
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      controller.sendNotificationReminder(
                          userToken: fcmToken,
                          service: service,
                          message: message.text);
                      // Get.to(() => DentalClinicSubscriptionView());
                    },
                    child: Text(
                      "Notify",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: Colors.red,
                          fontSize: 12.sp),
                    ))),
          ],
        ),
      ),
    ));
  }
}
