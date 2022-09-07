import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/login_screen_controller.dart';
import '../dialogs/login_dialogs.dart';

class LoginScreenView extends GetView<LoginController> {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/loginimage.png'),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 8.h,
              width: 100.w,
              child: TextField(
                controller: controller.username,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'User name',
                  hintText: 'Enter username',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 8.h,
              width: 100.w,
              child: TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Password',
                  hintText: 'Enter password',
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Obx(
              () => controller.isGettingCredentials.value == false
                  ? Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: InkWell(
                        onTap: () {
                          if (controller.username.text.isNotEmpty &&
                              controller.password.text.isNotEmpty) {
                            controller.login_user();
                          } else {
                            Get.snackbar(
                              "Message",
                              "Oops, Missing Input",
                              colorText: Colors.white,
                              backgroundColor: Colors.lightGreen,
                              snackPosition: SnackPosition.BOTTOM,
                            );
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
                            "LOGIN",
                            style: TextStyle(
                              letterSpacing: 4,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Container(
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
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  InkWell(
                    onTap: () {
                      LoginDialog.showDialogSignup();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
