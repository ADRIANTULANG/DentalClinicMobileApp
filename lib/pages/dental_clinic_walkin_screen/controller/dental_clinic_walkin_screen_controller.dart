import 'package:dcams/constant/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../api/dental_clinic_walkin_screen_api.dart';
import '../model/dental_clinic_walkin_screen_model.dart';

class DentalClinicWalkInController extends GetxController {
  TextEditingController patientname = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();

  RxDouble totalIncome = 0.0.obs;

  RxList<DentalWalkInModel> serviceslist = <DentalWalkInModel>[].obs;
  RxList<WalkinListModel> walkintransactionlist = <WalkinListModel>[].obs;
  RxString servicesName = ''.obs;
  RxString servicesprice = ''.obs;
  String time = DateFormat.jm().format(DateTime.now());

  RxBool isCreating = false.obs;
  RxBool isLoading = true.obs;

  Rx<DentalWalkInModel> initialValue = DentalWalkInModel(
          servicesId: "",
          servicesName: "".obs,
          servicesClinicId: "",
          servicesPrice: "",
          servicesDescription: "",
          servicesStatus: "")
      .obs;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() async {
    await getservices();
    await getwalkintransactions();
    isLoading(false);
    super.onInit();
  }

  getwalkintransactions() async {
    var result = await DentalClinicwalkinApi.getwalkintransactions();
    walkintransactionlist.assignAll(result);
    for (var i = 0; i < walkintransactionlist.length; i++) {
      totalIncome.value = totalIncome.value +
          double.parse(walkintransactionlist[i].servicePrice);
    }
  }

  getservices() async {
    var result = await DentalClinicwalkinApi.getDentalClinicServices();
    serviceslist.assignAll(result);
    initialValue.value = serviceslist[0];
    servicesName.value = serviceslist[0].servicesName.value;
    servicesprice.value = serviceslist[0].servicesPrice;
  }

  createWalkin() async {
    isCreating(true);
    var isSuccess = await DentalClinicwalkinApi.createWalkinTransaction(
      patient_name: patientname.text,
      service_name: servicesName.value,
      service_price: servicesprice.value,
      email: email.text,
      contact: contact.text,
      address: address.text,
      time: time,
    );
    if (isSuccess == true) {
      Get.back();
      getwalkintransactions();
      Get.snackbar(
        "Message",
        "Succesfully created",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Message",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isCreating(false);
  }
}
