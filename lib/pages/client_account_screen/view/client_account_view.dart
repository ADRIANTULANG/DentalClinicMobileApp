import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/client_account_controller.dart';

class ClientAccountView extends GetView<ClientAccountController> {
  const ClientAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClientAccountController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                controller.updateAccount();
              },
              child: Obx(
                () => controller.isUpdating.value == true
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
                          "UPDATE",
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
    );
  }
}
