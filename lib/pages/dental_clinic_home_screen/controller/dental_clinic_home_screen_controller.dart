import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/dental_clinic_home_screen/dialogs/dental_clinic_home_Screen_dialogs.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  bool isAlreadyRemind = false;

  RxString expirationDate = "".obs;

  TextEditingController remarks = TextEditingController();
  @override
  void onInit() async {
    await setDetails();
    await getClinicAppointments();

    isLoading(false);
    await getSubscriptionStatus();
    await getSubscriptionDates();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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

  refreshDate() async {
    getClinicAppointments();
    print("Refresh");
  }

  getClinicAppointments() async {
    List<DentalClinicAppointmentsModle> listpending = [];
    List<DentalClinicAppointmentsModle> listapproved = [];
    List<DentalClinicAppointmentsModle> data =
        await DentalClinicAppointmentsApi.getClinicAppointments();
    pendingList.clear();
    approvedList.clear();
    print(data.length);
    for (var i = 0; i < data.length; i++) {
      if (data[i].resStatus == "Pending") {
        listpending.add(data[i]);
      } else if (data[i].resStatus == "Approved") {
        listapproved.add(data[i]);
      }
    }
    pendingList.assignAll(listpending.reversed.toList());
    approvedList.assignAll(listapproved.reversed.toList());
  }

  approvedAppointMents({
    required String resID,
    required String userToken,
    required String service,
    required String date,
    required String time,
  }) async {
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
      sendNotification(
          userToken: userToken, service: service, date: date, time: time);
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

  getSubscriptionStatus() async {
    var result = await DentalClinicAppointmentsApi.getSubscritpionStatus();
    if (result == "Unpaid") {
      expirationDate.value = "Account Inactive";
      isAlreadyRemind = true;
      subscriptionStatus.value = "Unpaid";
      DentalClinicHomeScreenDialogs.showReminder();
    } else if (result == false) {
    } else {}
  }

  getSubscriptionDates() async {
    List<ClinicSubscriptionDates> result =
        await DentalClinicAppointmentsApi.getClinicSubscriptionDates();
    if (result.isEmpty) {
      expirationDate.value = "Account Inactive";
    } else {
      bool isExpired = result[0].subsExpirationDate.isBefore(DateTime.now());
      if (subscriptionStatus.value == "Unpaid") {
        expirationDate.value = "Account Inactive";
      } else {
        expirationDate.value = "Account Expiration Date: " +
            DateFormat.yMMMMd().format(result[0].subsExpirationDate);
      }
      if (isExpired == true) {
        await DentalClinicAppointmentsApi.updateClinicStatusToExpired();
        subscriptionStatus.value = "Unpaid";
        if (isAlreadyRemind == false) {
          expirationDate.value = "Account Inactive";
          Get.snackbar("Message",
              "Subscription Expired. Please subscribe again to activate your account. Thank you!",
              colorText: Colors.white,
              backgroundColor: AppColor.mainColors,
              snackPosition: SnackPosition.TOP,
              duration: Duration(seconds: 4));
        }
      } else {}
      // if(isExpired)
    }
  }

  testFunction() {
    DateTime expirationDate = DateTime(2022, 10, 9);
    bool isExpired = expirationDate.isBefore(DateTime.now());
    print(isExpired);
    if (isExpired == true) {
      print("expired");
    } else {
      print("not expired");
    }
  }

  sendNotification({
    required String userToken,
    required String service,
    required String date,
    required String time,
  }) async {
    await DentalClinicAppointmentsApi.sendNotification(
        userToken: userToken,
        service: service,
        date: date,
        time: time,
        clinic: Get.find<StorageServices>().storage.read('clinicName'));
  }
}
