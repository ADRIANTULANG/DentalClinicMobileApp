import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/dental_clinic_account_api.dart';

class DentalClinicAccountController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    username.text =
        Get.find<StorageServices>().storage.read('clinicUsername').toString();
    password.text =
        Get.find<StorageServices>().storage.read('clinicPassword').toString();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateClinicAccount() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Message",
        "Oops, Missing input.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      bool isSuccess = await DentalClinicAccountsApi.updateClinicCredentials(
          username: username.text, password: password.text);
      if (isSuccess == true) {
        Get.snackbar(
          "Message",
          "Credentials Successfully Updated",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.find<StorageServices>().saveClinicDetails(
            clinicId: Get.find<StorageServices>().storage.read('clinicId'),
            clinicName: Get.find<StorageServices>().storage.read('clinicName'),
            clinicUsername: username.text,
            clinicPassword: password.text,
            clinicAddress:
                Get.find<StorageServices>().storage.read('clinicAddress'),
            clinicLat: Get.find<StorageServices>().storage.read('clinicLat'),
            clinicLong: Get.find<StorageServices>().storage.read('clinicLong'),
            clinicImage:
                Get.find<StorageServices>().storage.read('clinicImage'),
            clinicDentistName:
                Get.find<StorageServices>().storage.read('clinicDentistName'),
            clinicEmail:
                Get.find<StorageServices>().storage.read('clinicEmail'),
            clinicContactNo:
                Get.find<StorageServices>().storage.read('clinicContactNo'),
            clinicStatus:
                Get.find<StorageServices>().storage.read('clinicStatus'),
            subscriptionStatus:
                Get.find<StorageServices>().storage.read('subscriptionStatus'));
      } else {
        Get.snackbar(
          "Message",
          "Sorry.. Please try again later",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
