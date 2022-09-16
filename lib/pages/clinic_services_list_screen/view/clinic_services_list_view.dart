import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../../clinic_booking_transaction_screen/view/clinic_booking_transaction_view.dart';
import '../controller/clinic_services_list_controller.dart';

class ClinicServicesListView extends GetView<ClinicServicesController> {
  const ClinicServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicServicesController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Obx(() => controller.isLoading.value == true
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
            : Column(
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Obx(
                    () => controller.servicesList.length == 0
                        ? SizedBox()
                        : Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                width: 100.w,
                                child: Obx(
                                  () => Text(
                                    controller.clinicName.value,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                width: 100.w,
                                child: Obx(
                                  () => Text(
                                    controller.clinicDentist.value,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                width: 100.w,
                                child: Obx(
                                  () => Text(
                                    controller.clinicEmail.value,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                width: 100.w,
                                child: Obx(
                                  () => Text(
                                    controller.clinicContactNo.value,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              )
                            ],
                          ),
                  ),
                  Obx(
                    () => controller.servicesList.length == 0
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                            width: 100.w,
                            child: Text(
                              "Available Services",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      child: Obx(
                        () => controller.servicesList.length == 0
                            ? Center(
                                child: Text(
                                  "Sorry.. \n No Available Services for this \n Dental Clinic.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: controller.servicesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.h, left: 3.w, right: 3.w),
                                    child: InkWell(
                                      onTap: () {
                                        // Get.to(
                                        //   () => ClinicBookingTransactionView(),
                                        //   arguments: {
                                        //     'servicesName': controller
                                        //         .servicesList[index]
                                        //         .servicesName,
                                        //     'servicesID': controller
                                        //         .servicesList[index].servicesId,
                                        //     'clinicID': controller
                                        //         .servicesList[index]
                                        //         .servicesClinicId,
                                        //     'servicesPrice': controller
                                        //         .servicesList[index]
                                        //         .servicesPrice,
                                        //     'clinicContactNo': controller
                                        //         .clinicContactNo.value,
                                        //     'clinicDentist':
                                        //         controller.clinicDentist.value,
                                        //   },
                                        // );
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => Checkbox(
                                                value: controller
                                                    .servicesList[index]
                                                    .servicesCheckbox
                                                    .value,
                                                onChanged: (value) {
                                                  if (controller
                                                          .servicesList[index]
                                                          .servicesCheckbox
                                                          .value ==
                                                      true) {
                                                    controller
                                                        .servicesList[index]
                                                        .servicesCheckbox
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .servicesList[index]
                                                        .servicesCheckbox
                                                        .value = true;
                                                  }
                                                }),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  bottom: 2.h,
                                                  left: 3.w,
                                                  right: 3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .servicesList[index]
                                                          .servicesName,
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          letterSpacing: 1.5,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Text(
                                                      "P " +
                                                          controller
                                                              .servicesList[
                                                                  index]
                                                              .servicesPrice,
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors.red,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Text(
                                                      controller
                                                          .servicesList[index]
                                                          .servicesDescription,
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          color: Colors.black,
                                                          letterSpacing: 1.5,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
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
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ClinicBookingTransactionView(),
                            arguments: {"clinicID": controller.clinicID.value});
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
                          "CHECKOUT",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              )),
      ),
    );
  }
}
