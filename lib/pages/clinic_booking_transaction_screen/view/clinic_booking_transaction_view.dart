import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controller/clinic_booking_transaction_controller.dart';

class ClinicBookingTransactionView
    extends GetView<ClinicBookingTransactionController> {
  const ClinicBookingTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicBookingTransactionController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100.w,
                child: Text(
                  "Reserve Now!",
                  style: TextStyle(
                      fontSize: 24.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Service: ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Obx(() => Text(
                            controller.servicesName.value,
                            style: TextStyle(
                                fontSize: 15.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Dentist: ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Obx(() => Text(
                            controller.clinicDentist.value,
                            style: TextStyle(
                                fontSize: 15.sp,
                                // color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Contact No: ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Obx(() => Text(
                            controller.clinicContactNo.value,
                            style: TextStyle(
                                fontSize: 15.sp,
                                // color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Price: ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Obx(() => Text(
                            "P " +
                                double.parse(controller.servicesPrice.value)
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
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Reservation Fee: ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Obx(
                        () => Text(
                          controller.reservationFee.value.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.red,
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.center,
                child: Text(
                  "Select Schedule",
                  style: TextStyle(
                      fontSize: 15.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
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
                  headerHeight: 3.h,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  headerStyle: DateRangePickerHeaderStyle(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  onSelectionChanged: controller.onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: controller.isCheckGcash.value,
                        onChanged: (value) {
                          if (controller.isCheckGcash.value == true) {
                            controller.isCheckGcash.value = false;
                            controller.isSelectedPaymentGateway.value = "";
                          } else {
                            controller.isCheckGcash.value = true;
                            controller.isSelectedPaymentGateway.value = "Gcash";
                          }
                          controller.isPaymaya.value = false;
                        }),
                  ),
                  Container(
                    height: 10.h,
                    child: Image.asset("assets/images/gcashlogo.png"),
                  )
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: controller.isPaymaya.value,
                        onChanged: (value) {
                          if (controller.isPaymaya.value == true) {
                            controller.isPaymaya.value = false;
                            controller.isSelectedPaymentGateway.value = "";
                          } else {
                            controller.isPaymaya.value = true;
                            controller.isSelectedPaymentGateway.value =
                                "Paymaya";
                          }
                          controller.isCheckGcash.value = false;
                        }),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    height: 8.h,
                    child: Image.asset("assets/images/paymaya.png"),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => controller.isSubmitingReservation.value == true
                    ? Container(
                        height: 8.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(10)),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          controller.submit_reservation();
                        },
                        child: Container(
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
