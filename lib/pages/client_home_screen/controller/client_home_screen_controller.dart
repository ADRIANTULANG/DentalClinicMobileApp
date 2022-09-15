import 'package:dcams/pages/client_home_screen/api/client_home_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/client_home_model.dart';

class ClientHomeViewController extends GetxController {
  RxList<ClientHomeModel> nearestClinic = <ClientHomeModel>[].obs;
  RxList<ClientHomeModel> nearestClinic_masterList = <ClientHomeModel>[].obs;

  TextEditingController searchValue = TextEditingController();
  RxBool isLoading = true.obs;
  RxBool isGettingClinics = true.obs;

  RxList<int> kilometersList = <int>[].obs;

  RxString isSelectedDistance = 5.toString().obs;

  @override
  void onInit() async {
    await getNearClinics(distanceInKilometers: 5.toString());
    await setListKilometers();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setListKilometers() {
    var count = 0;
    for (var i = 0; i < 20; i++) {
      count = count + 5;
      kilometersList.add(count);
    }
  }

  getNearClinics({required String distanceInKilometers}) async {
    isGettingClinics(true);
    nearestClinic.clear();
    nearestClinic_masterList.clear();
    nearestClinic.assignAll(await ClientHomeApi.getClinicNearest(
        distanceInKilometers: distanceInKilometers));
    nearestClinic_masterList.assignAll(nearestClinic);
    isGettingClinics(false);
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
