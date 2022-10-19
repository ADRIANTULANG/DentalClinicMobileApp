import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../controller/dental_clinic_home_screen_controller.dart';

class DentalClinicHistoryView
    extends GetView<DentalClinicHomeScreenController> {
  const DentalClinicHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "History",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                letterSpacing: 1.5,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 2.h),
                child: Obx(
                  () => controller.appointListAll.length == 0
                      ? Center(
                          child: Text(
                            "No History",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 12),
                          ),
                        )
                      : Obx(
                          () => ListView.builder(
                            padding: EdgeInsets.only(top: 1.h),
                            itemCount: controller.appointListAll.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: 2.h, left: 2.w, right: 2.w),
                                child: Container(
                                  height: 26.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 229, 239, 243),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color: Colors.grey)
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 24.h,
                                        padding: EdgeInsets.only(
                                            left: 2.w, top: 2.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.appointListAll[index]
                                                  .resServiceName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.5,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: .5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Name: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  controller
                                                      .appointListAll[index]
                                                      .clientName,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: .5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Date: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  DateFormat.yMMMMd().format(
                                                      controller
                                                          .appointListAll[index]
                                                          .resSchedule),
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: .5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Date: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  controller
                                                      .appointListAll[index]
                                                      .resScheduleTime,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Price: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "P ${controller.appointListAll[index].resServicePrice}",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Fee: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "P ${controller.appointListAll[index].resFee}",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Total Payment: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "P ${controller.appointListAll[index].resTotalAmount}",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.5,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                          ],
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
            )
          ],
        ),
      ),
    );
  }
}
