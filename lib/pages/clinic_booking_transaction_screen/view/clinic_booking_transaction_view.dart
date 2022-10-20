import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controller/clinic_booking_transaction_controller.dart';
import '../dialog/clinic_booking_transaction_dialog.dart';

class ClinicBookingTransactionView
    extends GetView<ClinicBookingTransactionController> {
  const ClinicBookingTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicBookingTransactionController());
    return Scaffold(
      body: Container(
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    child: SpinKitThreeBounce(
                      color: AppColor.mainColors,
                      size: 100.sp,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 2.h, bottom: 1.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.grey)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                width: 100.w,
                                child: Text(
                                  "Reserve Now!",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                child: Obx(
                                  () => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.servicesCheckList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: 100.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Service: ",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        letterSpacing: 1.5,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Obx(() => Text(
                                                          controller
                                                              .servicesCheckList[
                                                                  index]
                                                              .servicesName,
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize: 12.sp,
                                                              letterSpacing:
                                                                  1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 100.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Price: ",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        letterSpacing: 1.5,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                Container(
                                                  child: Obx(() => Text(
                                                        "P " +
                                                            controller
                                                                .servicesCheckList[
                                                                    index]
                                                                .servicesPrice,
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            letterSpacing: 1.5,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      );
                                    },
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
                      // Container(
                      //   width: 100.w,
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "Select Schedule",
                      //     style: TextStyle(
                      //         fontSize: 15.sp,
                      //         letterSpacing: 1,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      // ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.grey)
                              ]),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 30.h,
                                width: 100.w,
                                // color: AppColor.mainColors,
                                child: SfDateRangePicker(
                                  selectionShape:
                                      DateRangePickerSelectionShape.rectangle,
                                  enablePastDates: false,
                                  showNavigationArrow: true,
                                  headerStyle: DateRangePickerHeaderStyle(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  onSelectionChanged:
                                      controller.onSelectionChanged,
                                  selectionMode:
                                      DateRangePickerSelectionMode.single,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.grey)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 10.h,
                                width: 15.w,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      height: 10.h,
                                      scrollDirection: Axis.vertical),
                                  items: controller.hourss.map((hour) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.partialselectedHour
                                                  .value = hour.toString();
                                            },
                                            child: Container(
                                                height: 10.h,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                .partialselectedHour
                                                                .value ==
                                                            hour
                                                        ? AppColor.mainColors
                                                        : Colors.white),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '$hour',
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                height: 8.h,
                                alignment: Alignment.center,
                                child: Text(
                                  " : ",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 10.h,
                                width: 15.w,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      height: 10.h,
                                      scrollDirection: Axis.vertical),
                                  items: controller.minutes.map((minute) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.partialselectedMinutes
                                                  .value = minute.toString();
                                            },
                                            child: Container(
                                                height: 10.h,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                .partialselectedMinutes
                                                                .value ==
                                                            minute
                                                        ? AppColor.mainColors
                                                        : Colors.white),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '$minute',
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 10.h,
                                width: 15.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          controller.partialselectedAmPm.value =
                                              "AM";
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: controller.partialselectedAmPm
                                                      .value ==
                                                  "AM"
                                              ? AppColor.mainColors
                                              : Colors.white,
                                          height: 4.3.h,
                                          width: 15.w,
                                          child: Text(
                                            "AM",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          controller.partialselectedAmPm.value =
                                              "PM";
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: controller.partialselectedAmPm
                                                      .value ==
                                                  "PM"
                                              ? AppColor.mainColors
                                              : Colors.white,
                                          height: 4.3.h,
                                          width: 15.w,
                                          child: Text(
                                            "PM",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.grey)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                        value: controller.isCheckGcash.value,
                                        onChanged: (value) {
                                          if (controller.isCheckGcash.value ==
                                              true) {
                                            controller.isCheckGcash.value =
                                                false;
                                            controller.isSelectedPaymentGateway
                                                .value = "";
                                          } else {
                                            controller.isCheckGcash.value =
                                                true;
                                            controller.isSelectedPaymentGateway
                                                .value = "Gcash";
                                          }
                                          controller.isPaymaya.value = false;
                                        }),
                                  ),
                                  Container(
                                    height: 10.h,
                                    child: Image.asset(
                                        "assets/images/gcashlogo.png"),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                        value: controller.isPaymaya.value,
                                        onChanged: (value) {
                                          if (controller.isPaymaya.value ==
                                              true) {
                                            controller.isPaymaya.value = false;
                                            controller.isSelectedPaymentGateway
                                                .value = "";
                                          } else {
                                            controller.isPaymaya.value = true;
                                            controller.isSelectedPaymentGateway
                                                .value = "Paymaya";
                                          }
                                          controller.isCheckGcash.value = false;
                                        }),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Container(
                                    height: 8.h,
                                    child: Image.asset(
                                        "assets/images/paymaya.png"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Total Amount: ",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Obx(() => Text(
                                            "P " +
                                                controller.servicesFinalPrice
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.red,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.normal),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(
                        () => controller.isSubmitingReservation.value == true
                            ? Padding(
                                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                                child: Container(
                                    height: 8.h,
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColor.mainColors,
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              color: Colors.grey)
                                        ]),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                              )
                            : InkWell(
                                onTap: () {
                                  if (controller
                                          .isSelectedPaymentGateway.value !=
                                      "") {
                                    controller.checkConflict(
                                        context: context,
                                        controller: controller,
                                        paymentType: controller
                                            .isSelectedPaymentGateway.value);
                                  } else {
                                    Get.snackbar(
                                      "message",
                                      "Please choose one payment method.",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.redAccent,
                                      snackPosition: SnackPosition.TOP,
                                    );
                                  }
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.w, right: 5.w),
                                  child: Container(
                                    height: 8.h,
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColor.mainColors,
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              color: Colors.grey)
                                        ]),
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
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
