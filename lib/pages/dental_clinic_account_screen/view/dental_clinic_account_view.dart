import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dental_clinic_account_controller.dart';

class DentalClinicAccountView extends GetView<DentalClinicAccountController> {
  const DentalClinicAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicAccountController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Account Settings",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 5.h,
            ),
            // Text(
            //   "Clinic Name",
            //   style: TextStyle(
            //       fontWeight: FontWeight.normal,
            //       fontSize: 9.sp,
            //       letterSpacing: 2),
            // ),
            // SizedBox(
            //   height: .5.h,
            // ),
            // Container(
            //     height: 7.h,
            //     width: 100.w,
            //     child: Container(
            //       padding: EdgeInsets.only(left: 2.1.w),
            //       alignment: Alignment.centerLeft,
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey),
            //           borderRadius: BorderRadius.circular(8)),
            //       child: Text(
            //         Get.find<StorageServices>().storage.read('clinicName'),
            //         style: TextStyle(
            //             fontWeight: FontWeight.normal,
            //             fontSize: 12.sp,
            //             letterSpacing: 2),
            //       ),
            //     )),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "User name",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9.sp,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: .5.h,
            ),
            Container(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.username,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    letterSpacing: 2),
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9.sp,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: .5.h,
            ),
            Container(
              height: 7.h,
              width: 100.w,
              child: TextField(
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    letterSpacing: 2),
                controller: controller.password,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                controller.updateClinicAccount();
              },
              child: Container(
                  height: 7.h,
                  width: 100.w,
                  child: Container(
                    padding: EdgeInsets.only(left: 2.1.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.mainColors,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "UPDATE",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          letterSpacing: 2),
                    ),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
            // Text(
            //   "Clinic Dentist",
            //   style: TextStyle(
            //       fontWeight: FontWeight.normal,
            //       fontSize: 9.sp,
            //       letterSpacing: 2),
            // ),
            // SizedBox(
            //   height: .5.h,
            // ),
            // Container(
            //     height: 7.h,
            //     width: 100.w,
            //     child: Container(
            //       padding: EdgeInsets.only(left: 2.1.w),
            //       alignment: Alignment.centerLeft,
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey),
            //           borderRadius: BorderRadius.circular(8)),
            //       child: Text(
            //         Get.find<StorageServices>().storage.read('clinicDentistName'),
            //         style: TextStyle(
            //             fontWeight: FontWeight.normal,
            //             fontSize: 12.sp,
            //             letterSpacing: 2),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
