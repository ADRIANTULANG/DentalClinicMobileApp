import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dental_clinic_client_remarks_controller.dart';

class DentalClinicClientRemarksDialog {
  static showAddRemarks(
      {required DentalClinicClientRemarksController controller}) {
    Get.dialog(AlertDialog(
      content: Container(
        height: 30.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Remarks",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 15.sp),
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
                controller: controller.remarks,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    letterSpacing: 1.5),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Enter Remarks',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
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
                        "Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 1.5,
                            fontSize: 12.sp),
                      )),
                  TextButton(
                      onPressed: () {
                        Get.back();
                        controller.addRemarks();
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 1.5,
                            fontSize: 12.sp),
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
