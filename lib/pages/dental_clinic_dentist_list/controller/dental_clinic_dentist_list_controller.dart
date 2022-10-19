import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/dental_clinic_dentist_list_api.dart';
import '../model/dental_clinic_dentist_list_model.dart';

class DentalClinicDentistController extends GetxController {
  TextEditingController dentistName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();

  RxList<DentistModel> dentistList = <DentistModel>[].obs;

  RxBool isGettingCredentials = false.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    await getDentist();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createClinicDentist() async {
    isGettingCredentials(true);
    var isSuccess = await DentalClinicDentistApi.createDentist(
        dentist_name: dentistName.text,
        dentist_contact: contact.text,
        dentist_email: email.text);
    if (isSuccess == true) {
      Get.back();
      await getDentist();
      Get.snackbar(
        "Message",
        "Successfully created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Oopss.. Something is wrong. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
    isGettingCredentials(false);
  }

  getDentist() async {
    var result = await DentalClinicDentistApi.getDentist();
    dentistList.assignAll(result);
  }

  updateDentist({required String dentistid}) async {
    var isSuccess =
        await DentalClinicDentistApi.updateDentist(dentist_id: dentistid);
    if (isSuccess == true) {
      await getDentist();
      Get.snackbar(
        "Message",
        "Successfully deleted",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Oopss.. Something is wrong. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
