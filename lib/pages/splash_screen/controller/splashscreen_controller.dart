import 'dart:async';

import 'package:dcams/pages/dental_clinic_home_screen/view/dental_clinic_home_screen_view.dart';
import 'package:dcams/services/storage_services.dart';
import 'package:get/get.dart';

import '../../client_home_screen/view/client_home_screen_view.dart';
import '../../login_screen/view/login_screen_view.dart';
import '../../patients_rights_responsibilities_view/view/patients_rights_responsibilities_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    timerDelay();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  timerDelay() {
    Timer(Duration(seconds: 8), () {
      if (Get.find<StorageServices>().storage.read('isShown') == true) {
        if (Get.find<StorageServices>().storage.read('accountId') == null) {
          Get.to(() => LoginScreenView());
        } else {
          if (Get.find<StorageServices>().storage.read('userType') ==
              "Client") {
            Get.offAll(() => ClientHomeScreenView());
          } else {
            Get.offAll(() => DentalClinicHomeScreenView());
          }
        }
      } else {
        Get.to(() => RightsAndResponsibilitiesView());
      }
    });
  }
}
