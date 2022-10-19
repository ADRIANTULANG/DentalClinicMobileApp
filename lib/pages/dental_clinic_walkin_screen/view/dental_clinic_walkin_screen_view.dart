import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_walkin_screen_controller.dart';
import 'dental_clinic_walkin_add.dart';

class DentalClinicWalkInView extends GetView<DentalClinicWalkInController> {
  const DentalClinicWalkInView();

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicWalkInController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Obx(
          () => controller.isLoading.value == true
              ? Container(
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: AppColor.mainColors,
                      size: 100.sp,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Walk in",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              letterSpacing: 1),
                        ),
                        Text(
                          "P " +
                              controller.totalIncome.value.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.red,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                          itemCount: controller.walkintransactionlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: Container(
                                padding: EdgeInsets.only(left: 2.w, top: .5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 207, 205, 205)),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 18.h,
                                width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.walkintransactionlist[index]
                                          .patientName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      controller
                                          .walkintransactionlist[index].email,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      controller.walkintransactionlist[index]
                                          .contactno,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      DateFormat.yMMMMd().format(controller
                                          .walkintransactionlist[index].date),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      controller
                                          .walkintransactionlist[index].time,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      controller.walkintransactionlist[index]
                                          .serviceName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      "P " +
                                          controller
                                              .walkintransactionlist[index]
                                              .servicePrice,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp,
                                          color: Colors.red,
                                          letterSpacing: 1),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => DentalClinicAddWalkInView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
