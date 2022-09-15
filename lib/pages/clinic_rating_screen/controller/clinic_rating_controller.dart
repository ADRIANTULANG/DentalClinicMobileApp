import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/clinic_rating_api.dart';
import '../model/clinic_rating_model.dart';

class ClinicRatingController extends GetxController {
  RxList<ClinicRatingModel> clinicRatingList = <ClinicRatingModel>[].obs;
  RxString clinicImage = "".obs;
  RxString clinicID = "".obs;
  RxString clinicName = "".obs;
  RxString clinicContactNo = "".obs;
  RxString clinicDentist = "".obs;
  RxString clinicEmail = "".obs;
  RxBool isLoading = true.obs;
  RxDouble averageRating = 0.0.obs;
  TextEditingController commentTextEditing = TextEditingController();

  RxDouble rating_value = 0.0.obs;
  @override
  void onInit() async {
    clinicID.value = await Get.arguments['clinicID'];
    clinicName.value = await Get.arguments['clinicName'];
    clinicContactNo.value = await Get.arguments['clinicContactNo'];
    clinicDentist.value = await Get.arguments['clinicDentist'];
    clinicImage.value = await Get.arguments['clinicImage'];
    clinicEmail.value = await Get.arguments['clinicEmail'];
    await getClinicRating();
    super.onInit();
  }

  getClinicRating() async {
    var result =
        await ClinicRatingApi.getClinicRating(clinicID: clinicID.value);
    clinicRatingList.assignAll(result.reversed.toList());
    isLoading(false);
    calculateRatingOfClinic();
  }

  calculateRatingOfClinic() {
    var starscore = 0.0;
    for (var i = 0; i < clinicRatingList.length; i++) {
      starscore = starscore + double.parse(clinicRatingList[i].ratingScore);
    }

    if (clinicRatingList.isEmpty) {
      averageRating.value = 0;
    } else {
      averageRating.value = starscore / clinicRatingList.length;
    }
  }

  rateClinic() async {
    bool isSuccess = await ClinicRatingApi.rateClinic(
        clinicID: clinicID.value,
        rating_comment: commentTextEditing.text,
        rating_score: rating_value.value.toString());
    if (isSuccess == true) {
      getClinicRating();
      Get.snackbar(
        "Message",
        "Thank you for your rating and comments!.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later..",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
