import 'package:dcams/pages/clinic_registration_screen/view/clinic_registration_add_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/clinic_registration_controller.dart';

class ClinicRegistrationView extends GetView<ClinicRegistrationController> {
  const ClinicRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicRegistrationController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an Account",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 18.sp),
              ),
              Text(
                "for your Dental Clinic !",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Clinic Name",
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
                  controller: controller.clinicName,
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
                "Clinic Username",
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
                  controller: controller.clinicUsername,
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
                "Clinic Password",
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
                child: Obx(
                  () => TextField(
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        letterSpacing: 2),
                    controller: controller.clinicPassword,
                    obscureText: controller.isPasswordObscure.value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          if (controller.isPasswordObscure.value == true) {
                            controller.isPasswordObscure.value = false;
                          } else {
                            controller.isPasswordObscure.value = true;
                          }
                        },
                        child: Obx(
                          () => Icon(
                            Icons.remove_red_eye,
                            color: controller.isPasswordObscure.value
                                ? Colors.grey[400]
                                : AppColor.mainColors,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Clinic Address",
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
                  controller: controller.clinicAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Text(
              //   "Clinic Dentist Name",
              //   style: TextStyle(
              //       fontWeight: FontWeight.normal,
              //       fontSize: 9.sp,
              //       letterSpacing: 2),
              // ),
              // SizedBox(
              //   height: .5.h,
              // ),
              // Container(
              //   height: 7.h,
              //   width: 100.w,
              //   child: TextField(
              //     style: TextStyle(
              //         fontWeight: FontWeight.normal,
              //         fontSize: 12.sp,
              //         letterSpacing: 2),
              //     controller: controller.clinicDentistName,
              //     obscureText: false,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8)),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Clinic Email Address",
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
                  controller: controller.clinicEmailAdd,
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
                "Clinic Contact no.",
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
                  controller: controller.clinicContactno,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.clinicContactno.text.length == 0) {
                    } else {
                      if (controller.clinicContactno.text[0] != "9" ||
                          controller.clinicContactno.text.length > 10) {
                        controller.clinicContactno.clear();
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
              SizedBox(
                height: 9.h,
              ),
              InkWell(
                onTap: () {
                  if (controller.clinicName.text.isEmpty ||
                      controller.clinicUsername.text.isEmpty ||
                      controller.clinicPassword.text.isEmpty ||
                      controller.clinicAddress.text.isEmpty ||
                      // controller.clinicDentistName.text.isEmpty ||
                      controller.clinicEmailAdd.text.isEmpty ||
                      controller.clinicContactno.text.isEmpty) {
                    Get.snackbar(
                      "Message",
                      "Missing Input",
                      colorText: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      snackPosition: SnackPosition.TOP,
                    );
                  } else if (controller.clinicEmailAdd.text.isEmail == false) {
                    Get.snackbar(
                      "Message",
                      "Invalid Email Address",
                      colorText: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      snackPosition: SnackPosition.TOP,
                    );
                  } else {
                    Get.to(() => ClinicRegistrationUploadLogo());
                    // controller.verifiyNumber(
                    //     contact: controller.clinicEmailAdd.text);
                  }
                },
                child: Obx(
                  () => controller.isCreating.value == true
                      ? Container(
                          height: 7.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.mainColors),
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Container(
                          height: 7.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.mainColors),
                          alignment: Alignment.center,
                          child: Text(
                            "CREATE",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                letterSpacing: 2),
                          )),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
