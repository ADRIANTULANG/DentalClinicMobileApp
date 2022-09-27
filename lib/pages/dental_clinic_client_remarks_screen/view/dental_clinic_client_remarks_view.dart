import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../controller/dental_clinic_client_remarks_controller.dart';
import '../dialogs/dental_clinic_client_remarks_dialogs.dart';

class DentalClinicClientRemarksView
    extends GetView<DentalClinicClientRemarksController> {
  const DentalClinicClientRemarksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicClientRemarksController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: SpinKitThreeBounce(
                    color: AppColor.mainColors,
                    size: 100.sp,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Remarks of",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Obx(
                      () => Text(
                        controller.clientName.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            letterSpacing: 2),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => controller.remarksList.length == 0
                            ? Center(
                                child: Text(
                                  "No Remarks Yet.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.remarksList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 2.w, top: 1.5.h, bottom: 1.5.h),
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColor.mainColors),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .remarksList[index].clinicName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.remarksList[index]
                                                .clinicAddress,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Dentist:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                controller.remarksList[index]
                                                    .clinicDentistName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Text(
                                            controller
                                                .remarksList[index].clinicEmail,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.remarksList[index]
                                                .clinicContactNo,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            controller
                                                .remarksList[index].remarks,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 11.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            DateFormat.yMMMMd().format(
                                                controller.remarksList[index]
                                                    .createdAt),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 8.sp,
                                                letterSpacing: 1.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    )
                  ],
                ),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.isLoading.value == true
            ? SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  DentalClinicClientRemarksDialog.showAddRemarks(
                      controller: controller);
                },
                child: Icon(Icons.notes_rounded),
              ),
      ),
    );
  }
}
