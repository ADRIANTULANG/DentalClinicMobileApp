// import 'package:dcams/constant/color_class.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../controller/dental_clinic_home_screen_controller.dart';
import '../dialogs/dental_clinic_home_Screen_dialogs.dart';

class PendingTab extends GetView<DentalClinicHomeScreenController> {
  const PendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 2.h),
        child: Obx(
          () => controller.pendingList.length == 0
              ? Center(
                  child: Text(
                    "No Pending Appointments",
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
                    itemCount: controller.pendingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
                        child: Container(
                          height: 20.h,
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
                                height: 18.h,
                                width: 75.w,
                                // color: Colors.red,
                                padding: EdgeInsets.only(left: 2.w, top: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .pendingList[index].resServiceName,
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
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          controller
                                              .pendingList[index].clientName,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
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
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "P " +
                                              controller.pendingList[index]
                                                  .resServicePrice,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
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
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "P " +
                                              controller
                                                  .pendingList[index].resFee,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
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
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "P " +
                                              controller.pendingList[index]
                                                  .resTotalAmount,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        DentalClinicHomeScreenDialogs
                                            .showDialogForRemarks(
                                                resID: controller
                                                    .pendingList[index].resId,
                                                controller: controller);
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 25.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.approvedAppointMents(
                                            resID: controller
                                                .pendingList[index].resId);
                                      },
                                      child: Icon(
                                        Icons.check,
                                        size: 25.sp,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
