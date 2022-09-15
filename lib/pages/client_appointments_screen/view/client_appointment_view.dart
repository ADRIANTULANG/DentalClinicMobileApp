import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/client_appointment_controller.dart';

class ClientAppointmentView extends GetView<ClientAppointmentController> {
  const ClientAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClientAppointmentController());
    return Scaffold(
      body: Container(
        child: Obx(() => controller.isLoading.value == true
            ? Container(
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: SpinKitThreeBounce(
                    color: AppColor.mainColors,
                    size: 100.sp,
                  ),
                ))
            : Container(
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Obx(
                      () => controller.appointmentList.length == 0
                          ? SizedBox()
                          : Text(
                              "Appointments",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                  letterSpacing: 2),
                            ),
                    ),
                    Expanded(
                        child: Container(
                      child: Obx(
                        () => controller.appointmentList.length == 0
                            ? Center(
                                child: Text(
                                  "No Appointments yet..",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      letterSpacing: 2),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.appointmentList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.h,
                                        bottom: 1.h,
                                        left: 5.w,
                                        right: 5.w),
                                    child: Container(
                                      // height: 21.h,
                                      // width: 100.w,
                                      padding: EdgeInsets.only(
                                          top: 2.h,
                                          left: 2.h,
                                          bottom: 2.h,
                                          right: 2.h),
                                      decoration: BoxDecoration(
                                          color: AppColor.mainColors,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Appointment ID: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .resId,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Service: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .resServiceName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Status: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .resStatus,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
                                                    color: controller
                                                                .appointmentList[
                                                                    index]
                                                                .resStatus ==
                                                            "Pending"
                                                        ? Colors.orange
                                                        : controller
                                                                    .appointmentList[
                                                                        index]
                                                                    .resStatus ==
                                                                "Rejected"
                                                            ? Colors.redAccent
                                                            : Colors
                                                                .greenAccent,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Schedule Date: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                DateFormat.yMMMMd().format(
                                                    controller
                                                        .appointmentList[index]
                                                        .resSchedule),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Schedule Time: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .resScheduleTime,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Clinic: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .clinicName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Dentist: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .clinicDentistName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Contact No: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 2),
                                              ),
                                              Text(
                                                controller
                                                    .appointmentList[index]
                                                    .clinicContactNo,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          controller.appointmentList[index]
                                                          .resStatus ==
                                                      "Pending" ||
                                                  controller
                                                          .appointmentList[
                                                              index]
                                                          .resStatus ==
                                                      "Approved"
                                              ? SizedBox()
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Remarks: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12.sp,
                                                          letterSpacing: 2),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          controller
                                                              .appointmentList[
                                                                  index]
                                                              .resRemarks,
                                                          style: TextStyle(
                                                              // overflow:
                                                              //     TextOverflow
                                                              //         .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12.sp,
                                                              letterSpacing: 1),
                                                        ),
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
                    ))
                  ],
                ),
              )),
      ),
    );
  }
}
