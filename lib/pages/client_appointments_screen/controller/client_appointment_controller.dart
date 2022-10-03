import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/client_appointments_screen/api/client_appintments_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/client_appointments_model.dart';

class ClientAppointmentController extends GetxController {
  RxList<ClientAppointmentModel> appointmentList =
      <ClientAppointmentModel>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAppointments() async {
    var data = await ClientAppointmentsApi.getAppointments();
    data.reversed.toList();
    appointmentList.assignAll(data.reversed.toList());
    isLoading(false);
  }

  cancelAppointments({required String appointmentID}) async {
    var isSuccess = await ClientAppointmentsApi.cancelAppointments(
        appointmentID: appointmentID);
    if (isSuccess == true) {
      Get.snackbar(
        "Message",
        "Successfully Canceled",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      getAppointments();
    } else {
      Get.snackbar(
        "Message",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
