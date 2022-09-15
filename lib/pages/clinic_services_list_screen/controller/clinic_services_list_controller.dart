import 'package:dcams/pages/clinic_services_list_screen/api/clinic_services_list_api.dart';
import 'package:get/get.dart';

import '../model/clinic_services_list_model.dart';

class ClinicServicesController extends GetxController {
  RxString clinicID = "".obs;
  RxString clinicName = "".obs;
  RxString clinicContactNo = "".obs;
  RxString clinicDentist = "".obs;
  RxString clinicEmail = "".obs;
  RxList<ClinicServicesModel> servicesList = <ClinicServicesModel>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    clinicID.value = await Get.arguments['clinicID'];
    clinicName.value = await Get.arguments['clinicName'];
    clinicContactNo.value = await Get.arguments['clinicContactNo'];
    clinicDentist.value = await Get.arguments['clinicDentist'];
    clinicEmail.value = await Get.arguments['clinicEmail'];
    print(clinicID.value);
    await getClinicServices(clinicID: clinicID.value);
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getClinicServices({required String clinicID}) async {
    servicesList.assignAll(
        await ClinicServicesListApi.get_ClinicServices(clinicID: clinicID));
  }
}
