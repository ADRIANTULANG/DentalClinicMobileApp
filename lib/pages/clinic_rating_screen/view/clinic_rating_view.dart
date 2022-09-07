import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/clinic_rating_controller.dart';

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
        child: Column(
          children: [
            Text(
              "Ratings",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 18.sp),
            )
          ],
        ),
      ),
    );
  }
}
