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
                        : Container(
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                            width: 100.w,
                            child: Obx(
                              () => Text(
                                controller.clinicName.value,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
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
                                  fontSize: 13.sp,
                                  letterSpacing: 1,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
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
                                        top: 2.h,
                                        bottom: 2.h,
                                        left: 3.w,
                                        right: 3.w),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                            () =>
                                                ClinicBookingTransactionView(),
                                            arguments: {
                                              'servicesName': controller
                                                  .servicesList[index]
                                                  .servicesName,
                                              'servicesID': controller
                                                  .servicesList[index]
                                                  .servicesId,
                                              'clinicID': controller
                                                  .servicesList[index]
                                                  .servicesClinicId,
                                              'servicesPrice': controller
                                                  .servicesList[index]
                                                  .servicesPrice,
                                              'clinicContactNo': controller
                                                  .clinicContactNo.value,
                                              'clinicDentist': controller
                                                  .clinicDentist.value,
                                            });
                                      },
                                      child: Container(
                                        height: 25.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 227, 234, 241),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  spreadRadius: 1,
                                                  color: Colors.grey),
                                            ]),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 2.h, left: 3.w, right: 3.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.servicesList[index]
                                                    .servicesName,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "P " +
                                                    controller
                                                        .servicesList[index]
                                                        .servicesPrice,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Colors.red,
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    controller
                                                        .servicesList[index]
                                                        .servicesDescription,
                                                    maxLines: 6,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12.sp,
                                                        color: Colors.grey,
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
