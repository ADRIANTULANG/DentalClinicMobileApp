import 'dart:io';

import 'package:dcams/pages/clinic_registration_screen/controller/clinic_registration_controller.dart';
import 'package:dcams/pages/clinic_registration_screen/view/clinic_registration_add_documents.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';

class ClinicRegistrationUploadLogo
    extends GetView<ClinicRegistrationController> {
  const ClinicRegistrationUploadLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Upload Company Logo",
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Obx(() => controller.imagepath.value.trim().toString() == ""
                ? Container(
                    height: 40.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 25.sp,
                    ),
                  )
                : Container(
                    height: 40.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(controller.imagepath.value))),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                  )),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.openCamera();
                    },
                    child: Container(
                      height: 7.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Camera",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: () {
                      controller.openGallery();
                    },
                    child: Container(
                      height: 7.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Obx(
              () => controller.imagepath.value.trim().toString() != ""
                  ? InkWell(
                      onTap: () {
                        Get.to(() => ClinicRegistrationAddDocuments());
                        // controller.uploadImageLogo();
                      },
                      child: Container(
                        height: 7.h,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
