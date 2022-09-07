import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_services_list/api/dental_clinic_services_list_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/dental_clinic_services_model.dart';

class DentalClinicServicesListController extends GetxController {
  RxList<DentalClinicServicesModel> servicesList =
      <DentalClinicServicesModel>[].obs;
  RxBool isLoading = true.obs;
  TextEditingController servicesName = TextEditingController();
  TextEditingController servicesPrice = TextEditingController();
  TextEditingController servicesDescription = TextEditingController();
  @override
  void onInit() async {
    await getDentalClinicServices();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDentalClinicServices() async {
    var result = await DentalClinicServicessApi.getDentalClinicServices();
    servicesList.assignAll(result.reversed.toList());
  }

  createServices() async {
    if (servicesName.text.isEmpty ||
        servicesPrice.text.isEmpty ||
        servicesDescription.text.isEmpty) {
      Get.snackbar(
        "Message",
        "Oops.. Missing Input",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      var isSuccess = await DentalClinicServicessApi.createServices(
          services_name: servicesName.text.capitalizeFirst.toString(),
          services_price: servicesPrice.text,
          services_description:
              servicesDescription.text.capitalizeFirst.toString());
      if (isSuccess == true) {
        getDentalClinicServices();
        Get.snackbar(
          "Message",
          "Succesfully Added",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          "Message",
          "Sorry.. Please try again later.",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }
}
