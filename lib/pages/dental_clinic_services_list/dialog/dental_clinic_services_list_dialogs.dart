import 'package:dcams/constant/color_class.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../controller/dental_clinic_services_controller.dart';

class DentalClinicServicesListDialog {
  static showDialogForServicesRegistry(
      {required DentalClinicServicesListController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 60.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Services",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Service Name",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.servicesName,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Service Price",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.servicesPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Service Description",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 13.h,
                width: 100.w,
                child: TextField(
                  controller: controller.servicesDescription,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 230,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  controller.createServices();
                },
                child: Container(
                  height: 7.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  alignment: Alignment.center,
                  child: Text(
                    "ADD",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  static showDialogUpdateServices(
      {required DentalClinicServicesListController controller,
      required String servicesID}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 60.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Update Service",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Service Name",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.update_servicesName,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Service Price",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.update_servicesPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[11234567890.]'))
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Service Description",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 13.h,
                width: 100.w,
                child: TextField(
                  controller: controller.update_servicesDescription,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 230,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp,
                      letterSpacing: 1.5),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  controller.updateServices(servicesID: servicesID);
                },
                child: Container(
                  height: 7.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  alignment: Alignment.center,
                  child: Text(
                    "UPDATE",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        letterSpacing: 1.5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  static showDeleteDialogs(
      {required DentalClinicServicesListController controller,
      required String servicesID}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 20.h,
        width: 100.w,
        child: Column(
          children: [
            Text(
              "Message",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "Are you sure do you want to delete this services ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    letterSpacing: 1.5),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 100.w,
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
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          letterSpacing: 1.5),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.red,
                          letterSpacing: 1.5),
                    ),
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
