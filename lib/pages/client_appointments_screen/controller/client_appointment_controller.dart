import 'package:dcams/pages/client_appointments_screen/api/client_appintments_api.dart';
import 'package:get/get.dart';

import '../model/client_appointments_model.dart';

class ClientAppointmentController extends GetxController {
  RxList<ClientAppointmentModel> appointmentList =
      <ClientAppointmentModel>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAppointments() async {
    var data = await ClientAppointmentsApi.getAppointments();
    data.reversed.toList();
    appointmentList.assignAll(data.reversed.toList());
    isLoading(false);
  }
}
