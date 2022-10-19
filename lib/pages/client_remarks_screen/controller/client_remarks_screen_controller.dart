import 'package:get/get.dart';

import '../api/client_remarks_screen_api.dart';
import '../model/client_remarks_model.dart';

class ClientRemarksController extends GetxController {
  RxList<ClientRemarksModel> clientRemarks = <ClientRemarksModel>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() async {
    await getClientRemarks();
    isLoading(false);
    super.onInit();
  }

  getClientRemarks() async {
    var result = await ClientRemarksScreenApi.getRemarks();
    clientRemarks.assignAll(result);
  }

  updatePermissions({
    required String recordID,
    required String permission,
  }) async {
    await ClientRemarksScreenApi.updatePermission(
        recordID: recordID, permission: permission);
    getClientRemarks();
  }
}
