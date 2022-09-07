import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../controller/dental_clinic_home_screen_controller.dart';

class ApprovedTab extends GetView<DentalClinicHomeScreenController> {
  const ApprovedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 2.h),
        child: Obx(
          () => controller.approvedList.length == 0
              ? Center(
                  child: Text(
                    "No Approved Appointments",
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
                    itemCount: controller.approvedList.length,
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
                                padding: EdgeInsets.only(left: 2.w, top: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .approvedList[index].resServiceName,
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
                                              .approvedList[index].clientName,
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
                                          "P ${controller.approvedList[index].resServicePrice}",
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
                                          "P ${controller.approvedList[index].resFee}",
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
                                          "P ${controller.approvedList[index].resTotalAmount}",
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