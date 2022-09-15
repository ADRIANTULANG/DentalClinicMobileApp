import 'package:dcams/constant/color_class.dart';
import 'package:dcams/services/notification_services.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../client_home_screen/view/client_home_screen_view.dart';
import '../../dental_clinic_home_screen/view/dental_clinic_home_screen_view.dart';
import '../api/login_api.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  RxBool isGettingCredentials = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxList<LoginModel> userData = <LoginModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login_user() async {
    isGettingCredentials(true);
    userData.assignAll(await LoginApi.Futurelogin(
        username: username.text, password: password.text));

    if (userData.length != 0) {
      await Get.find<StorageServices>().saveCredentials(
        accountId: userData[0].accountId,
        username: userData[0].username,
        password: userData[0].password,
        userId: userData[0].userId,
        userType: userData[0].userType,
      );
      if (userData[0].userType == "Client") {
        var clientDetails =
            await LoginApi.getClientDetails(clientID: userData[0].userId);
        await Get.find<StorageServices>().saveClientCredentials(
          clientId: clientDetails[0].clientId,
          clientName: clientDetails[0].clientName,
          clientUsername: clientDetails[0].clientUsername,
          clientPassword: clientDetails[0].clientPassword,
          clientAddress: clientDetails[0].clientAddress,
          clientContactNo: clientDetails[0].clientContactNo,
          clientEmail: clientDetails[0].clientEmail,
        );
        await LoginApi.updateClientFCMtoken(
            clientID: clientDetails[0].clientId,
            fcmToken: Get.find<NotificationServices>().token!.toString());
        Get.offAll(() => ClientHomeScreenView());
      } else {
        var clinicDetails =
            await LoginApi.getClinicDetails(clinicID: userData[0].userId);
        if (clinicDetails[0].clinicStatus == "Pending") {
          Get.snackbar(
              "Message", "Your Account is still for Approval. Thank you!",
              colorText: Colors.white,
              backgroundColor: AppColor.mainColors,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 15));
          await Get.find<StorageServices>().removeStorageCredentials();
        } else if (clinicDetails[0].clinicStatus == "Denied") {
          Get.snackbar(
              "Message", "Sorry.. This Account was 'Denied' by the Management.",
              colorText: Colors.white,
              backgroundColor: AppColor.mainColors,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 15));
          await Get.find<StorageServices>().removeStorageCredentials();
        } else {
          await Get.find<StorageServices>().saveClinicDetails(
            clinicId: clinicDetails[0].clinicId,
            clinicName: clinicDetails[0].clinicName,
            clinicUsername: clinicDetails[0].clinicUsername,
            clinicPassword: clinicDetails[0].clinicPassword,
            clinicAddress: clinicDetails[0].clinicAddress,
            clinicLat: clinicDetails[0].clinicLat,
            clinicLong: clinicDetails[0].clinicLong,
            clinicImage: clinicDetails[0].clinicImage,
            clinicDentistName: clinicDetails[0].clinicDentistName,
            clinicEmail: clinicDetails[0].clinicEmail,
            clinicContactNo: clinicDetails[0].clinicContactNo,
            clinicStatus: clinicDetails[0].clinicStatus,
            subscriptionStatus: clinicDetails[0].subscriptionStatus,
          );
          await LoginApi.updateClinicFCMtoken(
              clinicID: clinicDetails[0].clinicId,
              fcmToken: Get.find<NotificationServices>().token!.toString());
          Get.offAll(() => DentalClinicHomeScreenView());
        }
      }
      isGettingCredentials(false);
    } else {
      Get.snackbar(
        "Message",
        "User did not exist!.",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
      isGettingCredentials(false);
    }
  }
}
