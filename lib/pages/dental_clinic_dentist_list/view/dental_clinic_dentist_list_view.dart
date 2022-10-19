import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_class.dart';
import '../controller/dental_clinic_dentist_list_controller.dart';
import 'dental_clinic_dentist_registration_view.dart';

class DentalClinicDentistView extends GetView<DentalClinicDentistController> {
  const DentalClinicDentistView();

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicDentistController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Obx(
          () => controller.isLoading.value == true
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Dentist",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                          letterSpacing: 1),
                    ),
                    Expanded(
                        child: Container(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.dentistList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 2.h,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 1.h, left: 3.w, bottom: 1.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 212, 211, 211))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller
                                              .dentistList[index].dentistName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                              letterSpacing: 1),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.updateDentist(
                                                    dentistid: controller
                                                        .dentistList[index]
                                                        .dentistId);
                                              },
                                              child: Icon(
                                                Icons.delete_rounded,
                                                size: 25.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      controller
                                          .dentistList[index].dentistEmail,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      controller
                                          .dentistList[index].dentistContact,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          letterSpacing: 1),
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
        ),
      ),
      floatingActionButton: Obx(
        () => controller.isLoading.value == true
            ? SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  Get.to(() => DentalClinicDentistRegistrationView());
                },
                child: Icon(Icons.person_add_rounded),
              ),
      ),
    );
  }
}
