import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/client_registration_controller.dart';

class ClientRegistrationView extends GetView<ClientRegistrationController> {
  const ClientRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClientRegistrationController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 7.h),
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
                "as Client !",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Name",
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
                  controller: controller.name,
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
                child: Obx(
                  () => TextField(
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        letterSpacing: 2),
                    controller: controller.password,
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
                "Address",
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
                  controller: controller.address,
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
                  controller: controller.contactno,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contactno.text.length == 0) {
                    } else {
                      if (controller.contactno.text[0] != "9" ||
                          controller.contactno.text.length > 10) {
                        controller.contactno.clear();
                      } else {}
                    }
                  },
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
                "Email Add",
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
                  controller: controller.emailAdd,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              InkWell(
                onTap: () {
                  if (controller.name.text.isEmpty ||
                      controller.username.text.isEmpty ||
                      controller.password.text.isEmpty ||
                      controller.contactno.text.isEmpty ||
                      controller.emailAdd.text.isEmpty) {
                    Get.snackbar(
                      "Message",
                      "Missing Input",
                      colorText: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else if (controller.emailAdd.text.isEmail == false) {
                    Get.snackbar(
                      "Message",
                      "Invalid Email Address",
                      colorText: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    controller.verifiyNumber(
                        contact: controller.contactno.text);
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
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
