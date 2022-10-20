import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/clinic_booking_transaction_controller.dart';

class ClinicBookingTransactionDialog {
  static showVerificationPaymentOptions(
      {required ClinicBookingTransactionController controller,
      required String paymentType,
      required BuildContext context}) {
    Get.dialog(
        AlertDialog(
          content: Container(
            height: 40.h,
            width: 90.w,
            child: Column(
              children: [
                paymentType == "Gcash"
                    ? Image.asset("assets/images/gcashlogo.png")
                    : Image.asset("assets/images/paymaya.png"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 5.h,
                  width: 100.w,
                  child: TextField(
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        letterSpacing: 2),
                    controller: controller.paymentContactTextField,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      if (controller.paymentContactTextField.text.length == 0) {
                      } else {
                        if (controller.paymentContactTextField.text[0] != "9" ||
                            controller.paymentContactTextField.text.length >
                                10) {
                          controller.paymentContactTextField.clear();
                        } else {}
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "9*********",
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.only(top: 1.h, left: 2.w),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    if (controller.paymentContactTextField.text.length != 10) {
                      Get.back();
                      Get.snackbar(
                        "message",
                        "Invalid Contact number",
                        colorText: Colors.white,
                        backgroundColor: Colors.redAccent,
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      Get.back();
                      FocusScope.of(context).unfocus();
                      controller.submit_reservation();
                    }
                  },
                  child: Obx(
                    () => controller.isSubmitingReservation.value == true
                        ? Container(
                            height: 8.h,
                            width: 100.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.mainColors,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : Container(
                            height: 8.h,
                            width: 100.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.mainColors,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "DONE",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
