import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_billing_controller.dart';

class DentalClinicBillingView extends GetView<DentalClinicBillingController> {
  const DentalClinicBillingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicBillingController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: SpinKitThreeBounce(
                    color: AppColor.mainColors,
                    size: 100.sp,
                  ),
                )
              : Column(
                  children: [
                    Text(
                      "Services Transaction Monitoring",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Balance:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Obx(
                            () => Text(
                              "P " +
                                  controller.totalBalanceamount.value
                                      .toStringAsFixed(2),
                              maxLines: 3,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  color: Colors.red,
                                  fontSize: 13.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => controller.billingList.length == 0
                              ? Center(
                                  child: Text(
                                    "Sorry.. No Available Data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 10.sp),
                                  ),
                                )
                              : Obx(
                                  () => ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: controller.billingList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 1.h),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 3.w, top: 3.w, bottom: 3.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.billingList[index]
                                                    .servicesName,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 1.5,
                                                    fontSize: 16.sp),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Service Price:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1.5,
                                                        fontSize: 10.sp),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "P " +
                                                          controller
                                                              .billingList[
                                                                  index]
                                                              .servicesPrice,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.red,
                                                          letterSpacing: 1.5,
                                                          fontSize: 10.sp),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Transactions:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1.5,
                                                        fontSize: 10.sp),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      controller
                                                          .billingList[index]
                                                          .numberOftransactServices,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 1.5,
                                                          fontSize: 10.sp),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Overall Amount:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1.5,
                                                        fontSize: 10.sp),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "P " +
                                                          controller.countOverAllAmount(
                                                              price: controller
                                                                  .billingList[
                                                                      index]
                                                                  .servicesPrice,
                                                              countOfTransactions:
                                                                  controller
                                                                      .billingList[
                                                                          index]
                                                                      .numberOftransactServices),
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 1.5,
                                                          color: Colors.red,
                                                          fontSize: 10.sp),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
