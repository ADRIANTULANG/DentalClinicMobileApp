import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_walkin_screen_controller.dart';
import '../model/dental_clinic_walkin_screen_model.dart';

class DentalClinicAddWalkInView extends GetView<DentalClinicWalkInController> {
  const DentalClinicAddWalkInView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Create walk in transaction",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.sp,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Patient name",
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
                  controller: controller.patientname,
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
                "Patient contact no",
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
                  controller: controller.contact,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp,
                      letterSpacing: 2),
                  obscureText: false,
                  keyboardType: TextInputType.number,
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
                "Patient address",
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
                  controller: controller.address,
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
                "Patient email",
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
                  controller: controller.email,
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
                height: 2.5.h,
              ),
              Container(
                height: 7.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6)),
                child: Obx(
                  () => DropdownButton<DentalWalkInModel>(
                    value: controller.initialValue.value,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 15.sp,
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 12.sp),
                    underline: SizedBox(),
                    onChanged: (DentalWalkInModel? value) {
                      controller.initialValue.value = value!;
                      controller.servicesName.value = value.servicesName.value;
                      controller.servicesprice.value = value.servicesPrice;
                    },
                    items: controller.serviceslist.map((services) {
                      return DropdownMenuItem(
                        child: Obx(() => Text(services.servicesName.value)),
                        value: services,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                  height: 7.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.centerLeft,
                  child:
                      Obx(() => Text("P " + controller.servicesprice.value))),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => controller.isCreating.value == false
                    ? InkWell(
                        onTap: () {
                          if (controller.patientname.text.isEmpty &&
                              controller.address.text.isEmpty &&
                              controller.email.text.isEmpty &&
                              controller.contact.text.isEmpty) {
                            Get.snackbar(
                              "Message",
                              "Oops, Missing Input",
                              colorText: Colors.white,
                              backgroundColor: Colors.lightGreen,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.contact.text.length != 10) {
                            Get.snackbar(
                              "Message",
                              "Oops, Invalid Contact number",
                              colorText: Colors.white,
                              backgroundColor: Colors.lightGreen,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            controller.createWalkin();
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
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
