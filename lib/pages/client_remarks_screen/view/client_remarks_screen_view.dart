import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/client_remarks_screen_controller.dart';

class ClientRemarksView extends GetView<ClientRemarksController> {
  const ClientRemarksView();

  @override
  @override
  Widget build(BuildContext context) {
    Get.put(ClientRemarksController());
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
                      "Records of",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Text(
                      Get.find<StorageServices>().storage.read('clientName'),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          letterSpacing: 2),
                    ),
                    Expanded(
                      child: Obx(
                        () => controller.clientRemarks.length == 0
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
                                itemCount: controller.clientRemarks.length,
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
                                          Row(
                                            children: [
                                              Container(
                                                width: 75.w,
                                                child: Text(
                                                  controller
                                                      .clientRemarks[index]
                                                      .clinicName,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                              PopupMenuButton(
                                                  child: Icon(Icons.settings),
                                                  itemBuilder: (BuildContext
                                                          context) =>
                                                      <PopupMenuEntry>[
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            controller.updatePermissions(
                                                                recordID: controller
                                                                    .clientRemarks[
                                                                        index]
                                                                    .remId,
                                                                permission:
                                                                    "Not Allowed");
                                                          },
                                                          child:
                                                              Text('Private'),
                                                        ),
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            controller.updatePermissions(
                                                                recordID: controller
                                                                    .clientRemarks[
                                                                        index]
                                                                    .remId,
                                                                permission:
                                                                    "Allowed");
                                                          },
                                                          child:
                                                              Text('Visible'),
                                                        ),
                                                      ])
                                            ],
                                          ),
                                          Text(
                                            controller.clientRemarks[index]
                                                .clinicAddress,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       "Dentist:",
                                          //       style: TextStyle(
                                          //           fontWeight: FontWeight.w400,
                                          //           fontSize: 12.sp,
                                          //           letterSpacing: 1.5),
                                          //     ),
                                          //     SizedBox(
                                          //       width: 1.w,
                                          //     ),
                                          //     Text(
                                          //       controller.clientRemarks[index]
                                          //           .clinicDentistName,
                                          //       style: TextStyle(
                                          //           fontWeight: FontWeight.w400,
                                          //           fontSize: 12.sp,
                                          //           letterSpacing: 1.5),
                                          //     ),
                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Text(
                                            controller.clientRemarks[index]
                                                .clinicEmail,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          Text(
                                            controller.clientRemarks[index]
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
                                                .clientRemarks[index].remarks,
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
                                                controller.clientRemarks[index]
                                                    .createdAt),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 8.sp,
                                                letterSpacing: 1.5),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            controller.clientRemarks[index]
                                                        .remarksPermission ==
                                                    "Allowed"
                                                ? "This record is visible to other clinics"
                                                : "This record is in private only you and ${controller.clientRemarks[index].clinicName} can view this record.",
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
    );
  }
}
