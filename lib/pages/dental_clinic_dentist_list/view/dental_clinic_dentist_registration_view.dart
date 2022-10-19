import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_dentist_list_controller.dart';

class DentalClinicDentistRegistrationView
    extends GetView<DentalClinicDentistController> {
  const DentalClinicDentistRegistrationView();

  @override
  Widget build(BuildContext context) {
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
              "Dentist Registration",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Dentist Name",
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
                controller: controller.dentistName,
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
              "Email Address",
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
                controller: controller.email,
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
              "Contact no.",
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
                controller: controller.contact,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (controller.contact.text.length == 0) {
                  } else {
                    if (controller.contact.text[0] != "9" ||
                        controller.contact.text.length > 10) {
                      controller.contact.clear();
                    } else {}
                  }
                },
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
            Obx(
              () => controller.isGettingCredentials.value == false
                  ? InkWell(
                      onTap: () {
                        if (controller.dentistName.text.isEmpty &&
                            controller.contact.text.isEmpty &&
                            controller.email.text.isEmpty) {
                          Get.snackbar(
                            "Message",
                            "Oops, Missing Input",
                            colorText: Colors.white,
                            backgroundColor: AppColor.mainColors,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } else if (controller.contact.text.length != 10) {
                          Get.snackbar(
                            "Message",
                            "Oops, Contact no. must be 10 digits",
                            colorText: Colors.white,
                            backgroundColor: AppColor.mainColors,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } else if (controller.email.text.isEmail == false) {
                          Get.snackbar(
                            "Message",
                            "Oops, Invalid email address.",
                            colorText: Colors.white,
                            backgroundColor: AppColor.mainColors,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } else {
                          controller.createClinicDentist();
                        }
                      },
                      child: Container(
                        height: 8.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black54)),
                        alignment: Alignment.center,
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 8.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black54)),
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
