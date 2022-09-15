import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/clinic_rating_controller.dart';

class ClinicRatingDialog {
  static showRatingDialog({required ClinicRatingController controller}) {
    Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.all(3.w),
      content: Container(
        height: 35.h,
        width: 90.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ratings & Comments",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              child: RatingBar.builder(
                initialRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  controller.rating_value.value = rating;
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              height: 15.h,
              width: 100.w,
              child: TextField(
                controller: controller.commentTextEditing,
                obscureText: false,
                style: TextStyle(fontSize: 11.sp, letterSpacing: 1.5),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Please leave a comment',
                ),
              ),
            ),
            Container(
              width: 90.w,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.back();
                  controller.rateClinic();
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
