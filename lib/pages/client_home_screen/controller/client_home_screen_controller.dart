import 'package:dcams/pages/client_home_screen/api/client_home_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/client_home_model.dart';

class ClientHomeViewController extends GetxController {
  RxList<ClientHomeModel> nearestClinic = <ClientHomeModel>[].obs;
  RxList<ClientHomeModel> nearestClinic_masterList = <ClientHomeModel>[].obs;

  TextEditingController searchValue = TextEditingController();
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    getNearClinics();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNearClinics() async {
    nearestClinic.assignAll(await ClientHomeApi.getClinicNearest());
    nearestClinic_masterList.assignAll(nearestClinic);
    isLoading(false);
  }

  searchClinic({required String value}) {
    if (value.trim().toString() == "" || value.isEmpty) {
      print("dre ");
      nearestClinic.assignAll(nearestClinic_masterList);
    } else {
      print("age dre");
      nearestClinic.assignAll(nearestClinic_masterList
          .where((u) => (u.clinicName
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              u.distance
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              u.clinicDentistName
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase())))
          .toList());
    }
  }
}
