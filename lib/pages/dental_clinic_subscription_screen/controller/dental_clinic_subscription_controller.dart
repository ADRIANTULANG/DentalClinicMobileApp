import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_subscription_screen/api/dental_clinic_subscription_api.dart';
import 'package:dcams/pages/login_screen/view/login_screen_view.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';

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
    DateTime exp = DateTime.now().add(Duration(days: 30));
    DateTime pur = DateTime.now();

    bool isSuccess =
        await DentalClinicSubscriptionsApi.updateClinicSubscription(
            amount: 1500.toString(),
            sub_expiration_date: exp.toString(),
            sub_purchased_date: pur.toString());

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
