import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../clinic_services_list_screen/controller/clinic_services_list_controller.dart';
import '../../clinic_services_list_screen/model/clinic_services_list_model.dart';
import '../api/clinic_booking_transaction_api.dart';
import '../dialog/clinic_booking_transaction_dialog.dart';

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
  TextEditingController paymentContactTextField = TextEditingController();

  List minutes = [];
  List hourss = [];

  RxString partialselectedAmPm = "AM".obs;
  RxString partialselectedHour = "01".obs;
  RxString partialselectedMinutes = "00".obs;

  RxBool isLoading = true.obs;

  DateTime dateSelected = DateTime.now();

  RxList<ClinicServicesModel> servicesCheckList = <ClinicServicesModel>[].obs;
  @override
  void onInit() async {
    // servicesName.value = await Get.arguments['servicesName'];
    // servicesID.value = await Get.arguments['servicesID'];
    clinicID.value = await Get.arguments['clinicID'];
    // servicesPrice.value = await Get.arguments['servicesPrice'];
    // clinicContactNo.value = await Get.arguments['clinicContactNo'];
    // clinicDentist.value = await Get.arguments['clinicDentist'];
    print(clinicID.value);
    await getHours();
    await getminutes();
    await getCheckItems();
    isLoading(false);
    super.onInit();
  }

  getCheckItems() {
    for (var i = 0;
        i < Get.find<ClinicServicesController>().servicesList.length;
        i++) {
      if (Get.find<ClinicServicesController>()
              .servicesList[i]
              .servicesCheckbox ==
          true) {
        servicesCheckList
            .add(Get.find<ClinicServicesController>().servicesList[i]);
        servicesFinalPrice.value = servicesFinalPrice.value +
            double.parse(Get.find<ClinicServicesController>()
                .servicesList[i]
                .servicesPrice);
      }
    }
    getTotalAmount();
  }

  getTotalAmount() async {
    reservationFee.value = servicesFinalPrice.value * 0.05;
    servicesFinalPrice.value =
        await servicesFinalPrice.value + reservationFee.value;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateSelected = args.value;
    print(dateSelected);
  }

  getminutes() {
    int starting = 0;
    for (var i = 0; i < 60; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      minutes.add(text);
      starting++;
    }
  }

  getHours() {
    int starting = 1;
    for (var i = 0; i < 12; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      hourss.add(text);
      starting++;
    }
  }

  submit_reservation() async {
    isSubmitingReservation(true);
    for (var i = 0; i < servicesCheckList.length; i++) {
      await ClinicBookingTransactionApi.create_reservation(
          res_schedule_time: partialselectedHour.value +
              ":" +
              partialselectedMinutes.value +
              " " +
              partialselectedAmPm.value,
          res_service_name: servicesCheckList[i].servicesName,
          res_clinic_id: clinicID.value,
          res_service_price: servicesCheckList[i].servicesPrice.toString(),
          res_fee: (double.parse(servicesCheckList[i].servicesPrice) * 0.05)
              .toStringAsFixed(2),
          res_total_amount:
              ((double.parse(servicesCheckList[i].servicesPrice)) +
                      (double.parse(servicesCheckList[i].servicesPrice) * 0.05))
                  .toStringAsFixed(2),
          res_schedule: dateSelected.toString(),
          res_payment_gateway: isSelectedPaymentGateway.value,
          res_client_id:
              Get.find<StorageServices>().storage.read('clientId').toString());
    }
    isSubmitingReservation(false);

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
  }

  checkConflict(
      {required ClinicBookingTransactionController controller,
      required String paymentType,
      required BuildContext context}) async {
    isSubmitingReservation(true);
    var result = await ClinicBookingTransactionApi.checkIfHasConflictDates(
      res_schedule: dateSelected.toString(),
      res_schedule_time: partialselectedHour.value +
          ":" +
          partialselectedMinutes.value +
          " " +
          partialselectedAmPm.value,
      res_clinic_id: clinicID.value,
    );
    if (result == "No Conflicts") {
      ClinicBookingTransactionDialog.showVerificationPaymentOptions(
          context: context,
          controller: controller,
          paymentType: controller.isSelectedPaymentGateway.value);
    } else if (result == "Has Conflicts") {
      Get.snackbar(
        "Message",
        "Oopss.. Conflict schedule. Please other time and date. Thank you",
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    } else if (result == false) {
      Get.snackbar(
        "Message",
        "Oopss. Something is wrong. Please try again later",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
    }
    isSubmitingReservation(false);
  }
}
