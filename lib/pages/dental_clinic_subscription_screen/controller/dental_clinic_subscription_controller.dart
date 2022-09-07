import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_subscription_screen/api/dental_clinic_subscription_api.dart';
import 'package:dcams/pages/login_screen/view/login_screen_view.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DentalClinicSubscriptionController extends GetxController {
  RxBool isCheckGcash = false.obs;
  RxBool isPaymaya = false.obs;
  RxBool isSubscribing = false.obs;

  RxString isSelectedPaymentGateway = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateClinicSubscription() async {
    isSubscribing(true);
    bool isSuccess =
        await DentalClinicSubscriptionsApi.updateClinicSubscription();
    if (isSuccess == true) {
      Get.find<StorageServices>().removeStorageCredentials();
      Get.offAll(() => LoginScreenView());
      Get.snackbar("Message", "Account Succesfully Activated. Please log in",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 30));
    } else {
      Get.snackbar("Message", "Sorry.. Please try again later",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 30));
    }
    isSubscribing(false);
  }
}
