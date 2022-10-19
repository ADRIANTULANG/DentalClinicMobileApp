import 'package:dcams/configs/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../controller/clinic_rating_controller.dart';
import '../dialog/clinic_rating_dialog.dart';

class ClinicRatingView extends GetView<ClinicRatingController> {
  const ClinicRatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicRatingController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
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
                    Obx(
                      () => Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${AppEndpoint.endPointDomain_image}/${controller.clinicImage.value}"))),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller.clinicName.value + " Ratings",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            Obx(
                              () => Text(
                                controller.averageRating.value == 0.0
                                    ? "0"
                                    : controller.averageRating.value.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                    fontSize: 18.sp),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 18.sp,
                              color: Colors.yellow[500],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Obx(
                    //   () => Text(
                    //     controller.clinicDentist.value,
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w400,
                    //         letterSpacing: 1.5,
                    //         fontSize: 11.sp),
                    //   ),
                    // ),
                    Obx(
                      () => Text(
                        controller.clinicEmail.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 11.sp),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.clinicContactNo.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 11.sp),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => controller.clinicRatingList.length == 0
                              ? Center(
                                  child: Text(
                                    "No Comments and Ratings yet..",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.5,
                                        fontSize: 11.sp),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.only(top: 1.h),
                                  itemCount: controller.clinicRatingList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 2.w,
                                            right: 2.w,
                                            bottom: 3.h,
                                            top: 2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5.h,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.mainColors,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    controller
                                                        .clinicRatingList[index]
                                                        .clientName[0],
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .clinicRatingList[
                                                              index]
                                                          .clientName,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 1.5,
                                                          fontSize: 13.sp),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          controller
                                                              .clinicRatingList[
                                                                  index]
                                                              .ratingScore,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  1.5,
                                                              fontSize: 13.sp),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          size: 15.sp,
                                                          color: Colors
                                                              .yellow[500],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              controller.clinicRatingList[index]
                                                  .ratingComment,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 1.5,
                                                  fontSize: 9.sp),
                                            ),
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
                  ClinicRatingDialog.showRatingDialog(controller: controller);
                },
                child: Icon(Icons.rate_review),
              ),
      ),
    );
  }
}
