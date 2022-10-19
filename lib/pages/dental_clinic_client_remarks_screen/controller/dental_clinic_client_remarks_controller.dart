import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_client_remarks_screen/model/dental_clinic_client_remarks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/storage_services.dart';
import '../api/dental_clinic_client_remarks_api.dart';

class DentalClinicClientRemarksController extends GetxController {
  RxString clientID = "".obs;
  RxString clientName = "".obs;
  RxString fcmToken = ''.obs;
  RxList<RemarksModel> remarksList = <RemarksModel>[].obs;
  TextEditingController remarks = TextEditingController();
  RxBool isLoading = true.obs;
  RxBool isNotifying = false.obs;

  @override
  void onInit() async {
    clientID.value = await Get.arguments['clientID'];
    clientName.value = await Get.arguments['clientName'];
    fcmToken.value = await Get.arguments['fcmToken'];
    await getRemarks();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getRemarks() async {
    var result = await DentalClinicClientRemarksApi.getClientRemarks(
        clientID: clientID.value);
    remarksList.assignAll(result.reversed.toList());
  }

  addRemarks() async {
    var isSuccess = await DentalClinicClientRemarksApi.createRemarks(
        remarks: remarks.text, clinicID: clientID.value);
    if (isSuccess == true) {
      getRemarks();
      Get.snackbar(
        "Message",
        "Remarks Successfully Created.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        "Message",
        "Sorry. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  sendNotificationRequest({required String clientName}) async {
    isNotifying(true);
    await DentalClinicClientRemarksApi.sendNotificationReminder(
      userToken: fcmToken.value,
      message:
          "${Get.find<StorageServices>().storage.read('clinicName')} wants to view your past records. Please set your permissions on the records setting to visible.",
    );
    isNotifying(false);
    Get.snackbar(
      "Message",
      "$clientName has been notified to set his/her records to visible for you.",
      colorText: Colors.white,
      backgroundColor: AppColor.mainColors,
      duration: Duration(seconds: 5),
      snackPosition: SnackPosition.TOP,
    );
  }
}
