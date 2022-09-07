import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/client_account_screen/api/client_account_api.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientAccountController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController emailAdd = TextEditingController();
  RxBool isUpdating = false.obs;
  @override
  void onInit() {
    name.text =
        Get.find<StorageServices>().storage.read('clientName').toString();
    username.text =
        Get.find<StorageServices>().storage.read('clientUsername').toString();
    password.text =
        Get.find<StorageServices>().storage.read('clientPassword').toString();
    address.text =
        Get.find<StorageServices>().storage.read('clientAddress').toString();
    contactno.text =
        Get.find<StorageServices>().storage.read('clientContactNo').toString();
    emailAdd.text =
        Get.find<StorageServices>().storage.read('clientEmail').toString();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateAccount() async {
    isUpdating(true);
    bool isSuccess = await ClientAccountApi.updateClientAccount(
        clientID:
            Get.find<StorageServices>().storage.read('clientId').toString(),
        name: name.text,
        username: username.text,
        password: password.text,
        address: address.text,
        contactno: contactno.text,
        emailAdd: emailAdd.text);
    if (isSuccess == true) {
      Get.snackbar(
        "Message",
        "Successfully Updated",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      Get.find<StorageServices>().saveClientCredentials(
          clientId:
              Get.find<StorageServices>().storage.read('clientId').toString(),
          clientName: name.text,
          clientUsername: username.text,
          clientPassword: password.text,
          clientAddress: address.text,
          clientContactNo: contactno.text,
          clientEmail: emailAdd.text);
    } else {
      Get.snackbar(
        "Message",
        "Sorry. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
    isUpdating(false);
  }
}
