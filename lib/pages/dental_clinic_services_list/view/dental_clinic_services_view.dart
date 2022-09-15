import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_services_controller.dart';
import '../dialog/dental_clinic_services_list_dialogs.dart';

class DentalClinicServicesListView
    extends GetView<DentalClinicServicesListController> {
  const DentalClinicServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicServicesListController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: Obx(
          () => controller.isLoading.value == true
              ? Container(
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: AppColor.mainColors,
                      size: 100.sp,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registered Services",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => controller.servicesList.length == 0
                              ? Center(
                                  child: Text(
                                    "No Available Services Registered",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                        letterSpacing: 1.5),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: controller.servicesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: 3.h,
                                            top: 1.h,
                                            right: 2.w,
                                            left: 2.w),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                controller.servicesList[index]
                                                    .servicesName,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.sp,
                                                    letterSpacing: 1.5),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Price: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 9.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                                Text(
                                                  "P" +
                                                      controller
                                                          .servicesList[index]
                                                          .servicesPrice,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 9.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Description: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 9.sp,
                                                      letterSpacing: 1.5),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .servicesList[index]
                                                        .servicesDescription,
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 9.sp,
                                                        letterSpacing: 1.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      DentalClinicServicesListDialog
                                                          .showDeleteDialogs(
                                                              controller:
                                                                  controller,
                                                              servicesID: controller
                                                                  .servicesList[
                                                                      index]
                                                                  .servicesId);
                                                    },
                                                    child: Icon(
                                                      Icons.delete_forever,
                                                      size: 20.sp,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller
                                                              .update_servicesName
                                                              .text =
                                                          controller
                                                              .servicesList[
                                                                  index]
                                                              .servicesName;
                                                      controller
                                                              .update_servicesPrice
                                                              .text =
                                                          controller
                                                              .servicesList[
                                                                  index]
                                                              .servicesPrice;
                                                      controller
                                                              .update_servicesDescription
                                                              .text =
                                                          controller
                                                              .servicesList[
                                                                  index]
                                                              .servicesDescription;
                                                      DentalClinicServicesListDialog
                                                          .showDialogUpdateServices(
                                                              controller:
                                                                  controller,
                                                              servicesID: controller
                                                                  .servicesList[
                                                                      index]
                                                                  .servicesId);
                                                    },
                                                    child: Icon(
                                                      Icons.mode_edit_outlined,
                                                      size: 20.sp,
                                                      color: Colors
                                                          .lightGreenAccent,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
                  controller.servicesName.clear();
                  controller.servicesPrice.clear();
                  controller.servicesDescription.clear();
                  DentalClinicServicesListDialog.showDialogForServicesRegistry(
                      controller: controller);
                },
                child: Icon(Icons.add_circle_rounded),
              ),
      ),
    );
  }
}
