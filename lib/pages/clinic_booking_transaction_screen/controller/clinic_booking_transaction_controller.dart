import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../api/clinic_booking_transaction_api.dart';

class ClinicBookingTransactionController extends GetxController {
  RxString servicesName = "".obs;
  RxString servicesID = "".obs;
  RxString clinicID = "".obs;
  RxString servicesPrice = "0.0".obs;
  RxString clinicContactNo = "".obs;
  RxString clinicDentist = "".obs;
  RxDouble servicesFinalPrice = 0.0.obs;
  RxDouble reservationFee = 0.0.obs;

  RxBool isCheckGcash = false.obs;
  RxBool isPaymaya = false.obs;

  RxBool isSubmitingReservation = false.obs;

  RxString isSelectedPaymentGateway = "".obs;

  DateTime dateSelected = DateTime.now();
  @override
  void onInit() async {
    servicesName.value = await Get.arguments['servicesName'];
    servicesID.value = await Get.arguments['servicesID'];
    clinicID.value = await Get.arguments['clinicID'];
    servicesPrice.value = await Get.arguments['servicesPrice'];
    clinicContactNo.value = await Get.arguments['clinicContactNo'];
    clinicDentist.value = await Get.arguments['clinicDentist'];
    print(servicesPrice.value);
    await getTotalAmount();
    super.onInit();
  }

  getTotalAmount() async {
    reservationFee.value = double.parse(servicesPrice.value) * 0.05;
    servicesFinalPrice.value =
        await double.parse(servicesPrice.value) + reservationFee.value;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateSelected = args.value;
    print(dateSelected);
  }

  submit_reservation() async {
    if (isSelectedPaymentGateway.value == "") {
      Get.snackbar(
        "message",
        "Please choose one payment method.",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      isSubmitingReservation(true);
      bool isSuccess = await ClinicBookingTransactionApi.create_reservation(
          res_service_name: servicesName.value,
          res_clinic_id: clinicID.value,
          res_service_price: servicesPrice.value.toString(),
          res_fee: reservationFee.value.toString(),
          res_total_amount: servicesFinalPrice.toStringAsFixed(2),
          res_schedule: dateSelected.toString(),
          res_payment_gateway: isSelectedPaymentGateway.value,
          res_client_id:
              Get.find<StorageServices>().storage.read('clientId').toString());
      if (isSuccess == true) {
        Get.back();
        Get.back();
        Get.back();

        Get.snackbar(
          "Message",
          "Succesfully Reserved",
          colorText: Colors.white,
          backgroundColor: AppColor.mainColors,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          "Message",
          "Please try again later.",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      }
      isSubmitingReservation(false);
    }
  }
}
