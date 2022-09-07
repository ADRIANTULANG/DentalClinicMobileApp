import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_home_screen/dialogs/dental_clinic_home_Screen_dialogs.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/dental_clinic_home_api.dart';
import '../model/dental_clinic_model.dart';

class DentalClinicHomeScreenController extends GetxController {
  RxString dentalClinicImage = "".obs;
  RxString dentalClinicDentist = "".obs;
  RxString dentalClinicEmailAdd = "".obs;
  RxString dentalClinicContactNo = "".obs;
  RxString dentalClinicName = "".obs;
  RxString dentalClinicAddress = "".obs;
  RxBool isLoading = true.obs;
  RxString subscriptionStatus = "".obs;

  RxBool isPendingSelected = true.obs;
  RxList<DentalClinicAppointmentsModle> pendingList =
      <DentalClinicAppointmentsModle>[].obs;
  RxList<DentalClinicAppointmentsModle> approvedList =
      <DentalClinicAppointmentsModle>[].obs;

  TextEditingController remarks = TextEditingController();
  @override
  void onInit() async {
    await setDetails();
    await getClinicAppointments();

    isLoading(false);
    if (Get.find<StorageServices>()
            .storage
            .read('subscriptionStatus')
            .toString() ==
        "Unpaid") {
      DentalClinicHomeScreenDialogs.showReminder();
    }

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setSubscription() {
    subscriptionStatus.value = Get.find<StorageServices>()
        .storage
        .read('subscriptionStatus')
        .toString();
  }

  setDetails() async {
    dentalClinicImage.value = await Get.find<StorageServices>()
        .storage
        .read("clinicImage")
        .toString();
    dentalClinicDentist.value = await Get.find<StorageServices>()
        .storage
        .read("clinicDentistName")
        .toString();
    dentalClinicEmailAdd.value = await Get.find<StorageServices>()
        .storage
        .read("clinicEmail")
        .toString();
    dentalClinicContactNo.value = await Get.find<StorageServices>()
        .storage
        .read("clinicContactNo")
        .toString();
    dentalClinicName.value =
        await Get.find<StorageServices>().storage.read("clinicName").toString();
    dentalClinicAddress.value = await Get.find<StorageServices>()
        .storage
        .read("clinicAddress")
        .toString();
  }

  getClinicAppointments() async {
    List<DentalClinicAppointmentsModle> data =
        await DentalClinicAppointmentsApi.getClinicAppointments();
    pendingList.clear();
    approvedList.clear();
    print(data.length);
    for (var i = 0; i < data.length; i++) {
      if (data[i].resStatus == "Pending") {
        pendingList.add(data[i]);
      } else if (data[i].resStatus == "Approved") {
        approvedList.add(data[i]);
      }
    }
  }

  approvedAppointMents({required String resID}) async {
    bool isSuccess = await DentalClinicAppointmentsApi.updateAppointment(
        resID: resID, remarks: "", status: "Approved");
    if (isSuccess == true) {
      Get.snackbar(
        "Message",
        "Succesfully Approved",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      getClinicAppointments();
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  rejectAppointments({required String resID, required String remarks}) async {
    bool isSuccess = await DentalClinicAppointmentsApi.updateAppointment(
        resID: resID, remarks: remarks, status: "Rejected");
    if (isSuccess == true) {
      Get.snackbar(
        "Message",
        "Succesfully Rejected",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      getClinicAppointments();
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
