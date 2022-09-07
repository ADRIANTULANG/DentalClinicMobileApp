import 'package:get/get.dart';

import '../api/dental_clinic_billing_api.dart';
import '../model/dental_clinic_billing_model.dart';

class DentalClinicBillingController extends GetxController {
  RxList<DentalClinicBillingModel> billingList =
      <DentalClinicBillingModel>[].obs;
  RxDouble totalBalanceamount = 0.0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getBilling();
    super.onInit();
  }

  getBilling() async {
    billingList.assignAll(await DentalClinicBillingApi.getBillingInfo());
    countBalance();
  }

  String countOverAllAmount(
      {required String price, required String countOfTransactions}) {
    var amount = double.parse(price) * double.parse(countOfTransactions);
    return amount.toStringAsFixed(2);
  }

  countBalance() {
    for (var i = 0; i < billingList.length; i++) {
      var amountAdded = double.parse(billingList[i].numberOftransactServices) *
          double.parse(billingList[i].servicesPrice);
      totalBalanceamount.value = totalBalanceamount.value + amountAdded;
    }
    isLoading(false);
  }
}
